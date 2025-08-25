########################################################################################################################
# Input Variables
########################################################################################################################

variable "db2_instance_name" {
  type        = string
  description = "The name of the Db2 instance to create."
}

variable "subscription_id" {
  type        = string
  description = "Value of the subscription ID to use with the subscription plan for Db2."
  default     = null
  sensitive   = true
}

variable "resource_group_id" {
  type        = string
  description = "The ID of the resource group that contains the Db2 instance."
}

variable "region" {
  type        = string
  description = "The region where the Db2 instance is created."
  default     = "us-south"

  validation {
    condition     = contains(["au-syd", "jp-tok", "eu-de", "eu-gb", "eu-es", "us-south", "ca-tor", "us-east", "br-sao"], var.region)
    error_message = "The value is not valid. Possible values are `au-syd`, `jp-tok`, `eu-de`, `eu-gb`, `eu-es`, `us-south`, `ca-tor`, `us-east`, or `br-sao`."
  }
}

variable "service_endpoints" {
  type        = string
  description = "Service endpoints for the Db2 instance. Possible values are `public`, `private`, or `public-and-private`."
  default     = "public"

  validation {
    error_message = "The value is not valid. Possible values are `public`, `private`, or `public-and-private`."
    condition     = contains(["public", "private", "public-and-private"], var.service_endpoints)
  }
}

variable "enable_high_availability" {
  type        = bool
  description = "Whether to enable high availability for the Db2 instance."
  default     = false
}

variable "enable_oracle_compatibility" {
  type        = bool
  description = "Whether to enable compatibility with Oracle for the Db2 instance."
  default     = false
}

variable "node_type" {
  type        = string
  description = "The node type of the Db2 instance. Possible values are `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32.128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, or `mx2.128x1024`."
  default     = "bx2.4x16"

  validation {
    error_message = "The value is not valid. Possible values are `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, or `mx2.128x1024`."
    condition     = contains(["bx2.1x4", "bx2.4x16", "bx2.8x32", "bx2.16x64", "bx2.32x128", "bx2.48x192", "mx2.4x32", "mx2.16x128", "mx2.128x1024"], var.node_type)
  }
}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags to associate with your Db2 instance."
  default     = []
}
