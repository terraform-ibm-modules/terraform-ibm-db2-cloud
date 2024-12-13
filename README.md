<!-- Update this title with a descriptive name. Use sentence case. -->
# DB2 project

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-db2-cloud?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-db2-cloud/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

This module creates a DB2 instance on IBM Cloud

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-db2-cloud](#terraform-ibm-db2-cloud)
* [Examples](./examples)
    * [Advanced example](./examples/advanced)
    * [Basic example](./examples/basic)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-db2-cloud

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl

```

### Required access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the 'Sample IBM Cloud' service and roles with applicable values.
The required information can usually be found in the services official
IBM Cloud documentation.
To view all available service permissions, you can go in the
console at Manage > Access (IAM) > Access groups and click into an existing group
(or create a new one) and in the 'Access' tab click 'Assign access'.
-->

<!--
You need the following permissions to run this module:

- Service
    - **Resource group only**
        - `Viewer` access on the specific resource group
    - **Sample IBM Cloud** service
        - `Editor` platform access
        - `Manager` service access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.72.1 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_db2.db2](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/db2) | resource |
| [ibm_resource_tag.tags](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db2_instance_name"></a> [db2\_instance\_name](#input\_db2\_instance\_name) | Name to give to the DB2 instance being provisioned | `string` | n/a | yes |
| <a name="input_enable_high_availability"></a> [enable\_high\_availability](#input\_enable\_high\_availability) | Whether to enable high availability on the DB2 instance | `bool` | `false` | no |
| <a name="input_enable_oracle_compatibility"></a> [enable\_oracle\_compatibility](#input\_enable\_oracle\_compatibility) | Whether to enable Oracle compatibility on the DB2 instance | `bool` | `false` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The node type of the DB2 instance, supported values are `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32.128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, or `mx2.128x1024` | `string` | `"bx2.4x16"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to provision the DB2 instance | `string` | `"us-south"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group to provision DB2 instance in | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Service endpoints for the DB2 instance, valid values are `public`, `private`, or `public-and-private` | `string` | `"public"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Value of the subscription ID to use with the subscription plan of DB2 | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the DB2 resource instance | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_crn"></a> [crn](#output\_crn) | CRN of the DB2 instance |
| <a name="output_dashboard_url"></a> [dashboard\_url](#output\_dashboard\_url) | Dashboard URL of the DB2 instance |
| <a name="output_name"></a> [name](#output\_name) | Name of the DB2 instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
