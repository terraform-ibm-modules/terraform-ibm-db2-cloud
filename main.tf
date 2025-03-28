/********************************************************************
This file is used to implement the ROOT module.
*********************************************************************/

resource "ibm_db2" "db2" {
  name                 = var.db2_instance_name
  service              = "dashdb-for-transactions"
  plan                 = var.subscription_id == null ? "performance" : "PerformanceSubscription"
  location             = var.region
  resource_group_id    = var.resource_group_id
  service_endpoints    = var.service_endpoints
  instance_type        = var.node_type == "bx2.1x4" ? null : var.node_type
  high_availability    = var.enable_high_availability ? "yes" : "no"
  oracle_compatibility = var.enable_oracle_compatibility ? "yes" : "no"
  subscription_id      = var.subscription_id
  tags                 = var.tags

  timeouts {
    create = "720m"
    update = "60m"
    delete = "30m"
  }
}
