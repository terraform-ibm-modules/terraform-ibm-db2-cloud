########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-south"
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "advanced"
}

variable "resource_group" {
  type        = string
  description = "The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable"
  default     = null
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}

variable "db2_instance_name" {
  type        = string
  description = "The name of the DB2 instance"
}

variable "service_endpoints" {
  type        = string
  description = "The service endpoints of the DB2 instance"
  default     = "public-and-private"
}

variable "oracle_compatibility" {
  type        = bool
  description = "Whether to enable Oracle compatibility mode on the DB2 instance"
  default     = false
}
