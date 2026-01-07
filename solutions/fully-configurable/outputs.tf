########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the DB2 instance"
  value       = module.db2_instance.crn
}

output "dashboard_url" {
  description = "Dashboard URL of the DB2 instance"
  value       = module.db2_instance.dashboard_url
}

output "name" {
  description = "Name of the DB2 instance"
  value       = module.db2_instance.name
}

output "resource_group_name" {
  description = "Resource group name where DB2 instance is created"
  value       = module.resource_group.resource_group_name
}

output "next_steps_text" {
  value       = "Proceed to store, manage and analyze your data."
  description = "Next steps text"
}

output "next_step_primary_label" {
  value       = "Go to the Db2 instance dashboard"
  description = "Primary label"
}

output "next_step_primary_url" {
  value       = module.db2_instance.dashboard_url
  description = "Primary URL"
}

output "next_step_secondary_label" {
  value       = "Learn more about IBM Db2 on Cloud"
  description = "Secondary label"
}

output "next_step_secondary_url" {
  value       = "https://www.ibm.com/docs/en/db2-as-a-service?topic=overview"
  description = "Secondary URL"
}
