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

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of a new or an existing resource group in which to provision key management resources to. If a prefix input variable is specified, it's added to the value in the `<prefix>-value` format."
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
