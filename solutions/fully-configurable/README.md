# Fully Configurable Solution

## Prerequisites
- An existing resource group

This solution supports provisioning and configuring the following infrastructure:
- A new DB2 instance on IBM Cloud.

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).

![db2-deployable-architecture](../../reference-architectures/deployable-architecture-db2cloud.svg)

<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.77.1 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crn_parser_subid"></a> [crn\_parser\_subid](#module\_crn\_parser\_subid) | terraform-ibm-modules/common-utilities/ibm//modules/crn-parser | 1.1.0 |
| <a name="module_db2_instance"></a> [db2\_instance](#module\_db2\_instance) | ../.. | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform-ibm-modules/resource-group/ibm | 1.2.0 |

### Resources

| Name | Type |
|------|------|
| [ibm_sm_arbitrary_secret.sm_subscription_id](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.77.1/docs/data-sources/sm_arbitrary_secret) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db2_instance_name"></a> [db2\_instance\_name](#input\_db2\_instance\_name) | The name of the DB2 instance | `string` | n/a | yes |
| <a name="input_enable_high_availability"></a> [enable\_high\_availability](#input\_enable\_high\_availability) | Whether to enable high availability on the DB2 instance | `bool` | `true` | no |
| <a name="input_enable_oracle_compatibility"></a> [enable\_oracle\_compatibility](#input\_enable\_oracle\_compatibility) | Whether to enable Oracle compatibility on the DB2 instance | `bool` | `false` | no |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | The name of an existing resource group in which to provision DB2 resources to. | `string` | `"Default"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API Key | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The node type of the DB2 instance, valid values are `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, `mx2.128x1024` | `string` | `"bx2.4x16"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix to add to all resources that this solution creates. To not use any prefix value, you can set this value to `null` or an empty string. | `string` | n/a | yes |
| <a name="input_provider_visibility"></a> [provider\_visibility](#input\_provider\_visibility) | Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints). | `string` | `"private"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to provision all resources created by this example | `string` | `"us-east"` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to be added to created resources | `list(string)` | `[]` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Service endpoints for the DB2 instance, valid values are `public`, `private`, or `public-and-private` | `string` | `"private"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Value of the subscription ID to use with the subscription plan of DB2 | `string` | `null` | no |
| <a name="input_subscription_id_secret_crn"></a> [subscription\_id\_secret\_crn](#input\_subscription\_id\_secret\_crn) | CRN of the secret which contains the subscription ID to use the subscription plan of DB2 | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_crn"></a> [crn](#output\_crn) | CRN of the DB2 instance |
| <a name="output_dashboard_url"></a> [dashboard\_url](#output\_dashboard\_url) | Dashboard URL of the DB2 instance |
| <a name="output_name"></a> [name](#output\_name) | Name of the DB2 instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
