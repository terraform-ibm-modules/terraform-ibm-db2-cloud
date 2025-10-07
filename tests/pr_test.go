// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"fmt"
	"testing"

	"github.com/IBM/go-sdk-core/core"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/cloudinfo"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testaddons"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testschematic"
)

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const advancedExampleDir = "examples/advanced"
const solutionDir = "solutions/fully-configurable"

const terraformVersion = "terraform_v1.10" // This should match the version in the ibm_catalog.json

// Service not available in all regions, hard-coding to us-east for time being
const region = "us-east"

func setupOptions(t *testing.T, prefix string, dir string) *testhelper.TestOptions {
	options := testhelper.TestOptionsDefaultWithVars(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  dir,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
		TerraformVars: map[string]interface{}{
			"db2_instance_name": "db2",
			"region":            region,
		},
	})
	return options
}

func TestRunAdvancedExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "adv", advancedExampleDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunUpgradeExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "adv-upg", advancedExampleDir)

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func setupDAOptions(t *testing.T, prefix string, dir string) *testschematic.TestSchematicOptions {
	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing:                t,
		TarIncludePatterns:     []string{"*.tf", fmt.Sprintf("%s/*.tf", solutionDir)},
		TemplateFolder:         solutionDir,
		ResourceGroup:          resourceGroup,
		Region:                 region,
		Prefix:                 prefix,
		Tags:                   []string{"test-schematic"},
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 120,
		TerraformVersion:       terraformVersion,
	})

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
		{Name: "db2_instance_name", Value: "standard-db2", DataType: "string"},
		{Name: "existing_resource_group_name", Value: resourceGroup, DataType: "string"},
		{Name: "region", Value: region, DataType: "string"},
	}

	return options
}

func TestRunDASchematics(t *testing.T) {
	t.Parallel()

	options := setupDAOptions(t, "db2", solutionDir)

	err := options.RunSchematicTest()
	assert.NoError(t, err, "Schematic Test had an unexpected error")
}

func TestRunUpgradeDASchematics(t *testing.T) {
	t.Parallel()

	options := setupDAOptions(t, "db2-upg", solutionDir)
	options.CheckApplyResultForUpgrade = true

	err := options.RunSchematicUpgradeTest()
	if !options.UpgradeTestSkipped {
		assert.NoError(t, err, "Schematic Upgrade Test had an unexpected error")
	}
}

func TestDefaultConfiguration(t *testing.T) {

	options := testaddons.TestAddonsOptionsDefault(&testaddons.TestAddonOptions{
		Testing:       t,
		Prefix:        "db2deft",
		ResourceGroup: resourceGroup,
		QuietMode:     true, // Suppress logs except on failure
	})

	options.AddonConfig = cloudinfo.NewAddonConfigTerraform(
		options.Prefix,
		"deploy-arch-ibm-db2-cloud",
		"fully-configurable",
		map[string]interface{}{
			"prefix":                       options.Prefix,
			"existing_resource_group_name": resourceGroup,
		},
	)

	// Disable target / route creation to prevent hitting quota in account
	options.AddonConfig.Dependencies = []cloudinfo.AddonConfig{
		{
			OfferingName:   "deploy-arch-ibm-cloud-monitoring",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"enable_metrics_routing_to_cloud_monitoring": false,
			},
			Enabled: core.BoolPtr(true),
		},
		{
			OfferingName:   "deploy-arch-ibm-activity-tracker",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"enable_activity_tracker_event_routing_to_cloud_logs": false,
			},
			Enabled: core.BoolPtr(true),
		},
	}

	err := options.RunAddonTest()
	require.NoError(t, err)
}
