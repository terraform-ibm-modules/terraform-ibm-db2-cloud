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
  default     = null
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

variable "node_type" {
  type        = string
  description = "The node type of the DB2 instance, supported values are `nil`, `bx2.4x16`, or `bx2.8x32`"
  default     = "nil"
}

variable "enable_oracle_compatibility" {
  type        = bool
  description = "Whether to enable Oracle compatibility on the DB2 instance"
  default     = false
}
