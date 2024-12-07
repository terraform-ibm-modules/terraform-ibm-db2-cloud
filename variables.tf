########################################################################################################################
# Input Variables
########################################################################################################################

variable "db2_instance_name" {
  type        = string
  description = "Name to give to the DB2 instance being provisioned"
}

variable "resource_group_id" {
  type        = string
  description = "ID of resource group to provision DB2 instance in"
}

variable "region" {
  type        = string
  description = "Region to provision the DB2 instance"
  default     = "us-south"
}

variable "service_endpoints" {
  type        = string
  description = "Service endpoints for the DB2 instance, valid values are `public`, `private`, or `public-and-private`"
  default     = "public"

  validation {
    error_message = "`service_endpoints` must be one of: `public`, `private`, or `public-and-private`."
    condition     = contains(["public", "private", "public-and-private"], var.service_endpoints)
  }
}

variable "enable_high_availability" {
  type        = bool
  description = "Whether to enable high availability on the DB2 instance"
  default     = false
}

variable "enable_oracle_compatibility" {
  type        = bool
  description = "Whether to enable Oracle compatibility on the DB2 instance"
  default     = false
}

variable "node_type" {
  type        = string
  description = "The node type of the DB2 instance, supported values are `nil`, `bx2.4x16`, or `bx2.8x32`"
  default     = "nil"

  validation {
    error_message = "`node_type` must be one of: `nil`, `bx2.4x16`, or `bx2.8x32`"
    condition     = contains(["nil", "bx2.4x16", "bx2.8x32"], var.node_type)
  }
}

variable "tags" {
  type        = list(string)
  description = "Tags applied to the DB2 resource instance"
  default     = []
}
