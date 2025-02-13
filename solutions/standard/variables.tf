########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-east"
}

variable "prefix" {
  type        = string
  description = "The prefix to add to all resources that this solution creates. To not use any prefix value, you can set this value to `null` or an empty string."
  default     = "dev"
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

variable "subscription_id" {
  type        = string
  description = "Value of the subscription ID to use with the subscription plan of DB2"
  default     = null
  sensitive   = true
}

variable "subscription_id_secret_crn" {
  type        = string
  description = "CRN of the secret which contains the subscription ID to use the subscription plan of DB2"
  default     = null
}

variable "node_type" {
  type        = string
  description = "The node type of the DB2 instance, valid values are `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, `mx2.128x1024`"
  default     = "bx2.4x16"
}

variable "enable_oracle_compatibility" {
  type        = bool
  description = "Whether to enable Oracle compatibility on the DB2 instance"
  default     = false
}
