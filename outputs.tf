########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the Db2 instance."
  value       = ibm_db2.db2.crn
}

output "dashboard_url" {
  description = "Dashboard URL of the Db2 instance."
  value       = ibm_db2.db2.dashboard_url
}

output "name" {
  description = "Name of the Db2 instance"
  value       = ibm_db2.db2.name
}
