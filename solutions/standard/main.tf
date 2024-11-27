########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# DB2 instance
########################################################################################################################

module "db2_instance" {
  source                      = "../.."
  db2_instance_name           = try("${var.prefix}-${var.db2_instance_name}", var.db2_instance_name)
  resource_group_id           = module.resource_group.resource_group_id
  service_endpoints           = "private"
  enable_high_availability    = true
  enable_oracle_compatibility = var.enable_oracle_compatibility
  node_type                   = var.node_type
  tags                        = var.resource_tags
}
