########################################################################################################################
# Input Variables
########################################################################################################################

variable "db2_instance_name" {
  type        = string
  description = "Name to give to the DB2 instance being provisioned"
}

variable "subscription_id" {
  type        = string
  description = "Value of the subscription ID to use with the subscription plan of DB2"
  default     = null
  sensitive   = true
}

variable "resource_group_id" {
  type        = string
  description = "ID of resource group to provision DB2 instance in"
}

variable "region" {
  type        = string
  description = "Region to provision the DB2 instance"
  default     = "us-south"

  validation {
    condition     = contains(["au-syd", "jp-tok", "eu-de", "eu-gb", "eu-es", "us-south", "ca-tor", "us-east", "br-sao"], var.region)
    error_message = "Invalid value for `region`, valid values are: `au-syd`, `jp-tok`, `eu-de`, `eu-gb`, `eu-es`, `us-south`, `ca-tor`, `us-east`, `br-sao`"
  }
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
  description = "The node type of the DB2 instance, supported values are `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32.128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, or `mx2.128x1024`"
  default     = "bx2.4x16"

  validation {
    error_message = "`node_type` must be one of: `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, `mx2.128x1024`"
    condition     = contains(["bx2.1x4", "bx2.4x16", "bx2.8x32", "bx2.16x64", "bx2.32x128", "bx2.48x192", "mx2.4x32", "mx2.16x128", "mx2.128x1024"], var.node_type)
  }
}

variable "tags" {
  type        = list(string)
  description = "Tags applied to the DB2 resource instance"
  default     = []
}
