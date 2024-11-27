/********************************************************************
This file is used to implement the ROOT module.
*********************************************************************/

resource "ibm_db2" "db2" {
  name              = var.db2_instance_name
  resource_group_id = var.resource_group_id
  location          = "us-south"
  plan              = "performance"
  service           = "dashdb-for-transactions"
  service_endpoints = var.service_endpoints

  parameters = {
    "high_availability" : var.enable_high_availability ? "yes" : "no",
    "oracle_compatibility" : var.enable_oracle_compatibility ? "yes" : "no",
    "version" : "12",
    "node_type" : var.node_type
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