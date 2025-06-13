########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.2.0"
  existing_resource_group_name = var.existing_resource_group_name
}

module "crn_parser_subid" {
  count   = var.subscription_id_secret_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.1.0"
  crn     = var.subscription_id_secret_crn
}

data "ibm_sm_arbitrary_secret" "sm_subscription_id" {
  count       = var.subscription_id_secret_crn != null ? 1 : 0
  provider    = ibm.ibm-sm
  instance_id = module.crn_parser_subid[0].service_instance
  region      = module.crn_parser_subid[0].region
  secret_id   = module.crn_parser_subid[0].resource
}

locals {
  sm_region       = var.subscription_id_secret_crn != null ? module.crn_parser_subid[0].region : ""
  subscription_id = var.subscription_id_secret_crn != null ? data.ibm_sm_arbitrary_secret.sm_subscription_id[0].payload : (var.subscription_id != null ? var.subscription_id : null)
  prefix          = var.prefix != null ? trimspace(var.prefix) != "" ? "${var.prefix}-" : "" : ""
}

########################################################################################################################
# DB2 instance
########################################################################################################################

module "db2_instance" {
  source                      = "../.."
  region                      = var.region
  db2_instance_name           = "${local.prefix}${var.db2_instance_name}"
  subscription_id             = local.subscription_id
  resource_group_id           = module.resource_group.resource_group_id
  service_endpoints           = var.service_endpoints
  enable_high_availability    = var.enable_high_availability
  enable_oracle_compatibility = var.enable_oracle_compatibility
  node_type                   = var.node_type
  tags                        = var.resource_tags
}
