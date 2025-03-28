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
