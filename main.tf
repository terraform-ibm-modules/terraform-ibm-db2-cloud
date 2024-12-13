/********************************************************************
This file is used to implement the ROOT module.
*********************************************************************/

resource "ibm_db2" "db2" {
  name              = var.db2_instance_name
  resource_group_id = var.resource_group_id
  location          = var.region
  plan              = var.subscription_id == null ? "performance-preprod" : "PerformanceSubscription"
  service           = "dashdb-for-transactions"
  high_availability = var.enable_high_availability ? "yes" : "no"
  service_endpoints = var.service_endpoints

  parameters = {
    "oracle_compatibility" : var.enable_oracle_compatibility ? "yes" : "no",
    "version" : "12",
    "node_type" : var.node_type,
    "subscription_id" : var.subscription_id == null ? "" : var.subscription_id
  }

  timeouts {
    create = "720m"
    update = "60m"
    delete = "30m"
  }
}

resource "ibm_resource_tag" "tags" {
  resource_id = ibm_db2.db2.crn
  tags        = var.tags
}
