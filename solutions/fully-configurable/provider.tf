########################################################################################################################
# Provider config
########################################################################################################################

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  visibility       = var.provider_visibility
  region           = var.region
}

provider "ibm" {
  alias            = "ibm-sm"
  ibmcloud_api_key = var.ibmcloud_api_key
  visibility       = var.provider_visibility
  region           = local.sm_region
}
