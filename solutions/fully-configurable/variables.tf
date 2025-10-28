########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "secrets_manager_ibmcloud_api_key" {
  type        = string
  description = "API key to authenticate on Secrets Manager instance. If null the ibmcloud_api_key will be used."
  default     = null
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
  description = "The region to provision all resources in. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/region) about how to select different regions for different services."
  default     = "us-east"

  validation {
    condition     = contains(["au-syd", "jp-tok", "eu-de", "eu-gb", "eu-es", "us-south", "ca-tor", "us-east", "br-sao"], var.region)
    error_message = "Invalid value for `region`, valid values for DB2 on cloud offering are: `au-syd`, `jp-tok`, `eu-de`, `eu-gb`, `eu-es`, `us-south`, `ca-tor`, `us-east`, `br-sao`"
  }
}

variable "prefix" {
  type        = string
  nullable    = true
  description = "The prefix to add to all resources that this solution creates (e.g `prod`, `test`, `dev`). To skip using a prefix, set this value to null or an empty string. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/prefix.md)."

  validation {
    # - null and empty string is allowed
    # - Must not contain consecutive hyphens (--): length(regexall("--", var.prefix)) == 0
    # - Starts with a lowercase letter: [a-z]
    # - Contains only lowercase letters (a–z), digits (0–9), and hyphens (-)
    # - Must not end with a hyphen (-): [a-z0-9]
    condition = (var.prefix == null || var.prefix == "" ? true :
      alltrue([
        can(regex("^[a-z][-a-z0-9]*[a-z0-9]$", var.prefix)),
        length(regexall("--", var.prefix)) == 0
      ])
    )
    error_message = "Prefix must begin with a lowercase letter and may contain only lowercase letters, digits, and hyphens '-'. It must not end with a hyphen('-'), and cannot contain consecutive hyphens ('--')."
  }

  validation {
    # must not exceed 16 characters in length
    condition     = var.prefix == null || var.prefix == "" ? true : length(var.prefix) <= 16
    error_message = "Prefix must not exceed 16 characters."
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of an existing resource group to provision the resources. [Learn more](https://cloud.ibm.com/docs/account?topic=account-rgs&interface=ui#create_rgs) about how to create a resource group."
  default     = "Default"
}

variable "service_endpoints" {
  type        = string
  description = "Service endpoints for the DB2 instance, valid values are `public`, `private`, or `public-and-private`"
  default     = "private"

  validation {
    error_message = "`service_endpoints` must be one of: `public`, `private`, or `public-and-private`."
    condition     = contains(["public", "private", "public-and-private"], var.service_endpoints)
  }
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}

variable "db2_instance_name" {
  type        = string
  description = "The name of the DB2 instance"
  default     = "db2"
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
  description = "The node type of the DB2 instance, valid values are `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, `mx2.128x1024`"
  default     = "bx2.4x16"

  validation {
    condition     = contains(["bx2.1x4", "bx2.4x16", "bx2.8x32", "bx2.16x64", "bx2.32x128", "bx2.48x192", "mx2.4x32", "mx2.16x128", "mx2.128x1024"], var.node_type)
    error_message = "Invalid value for `node_type`, valid values are: `bx2.1x4`, `bx2.4x16`, `bx2.8x32`, `bx2.16x64`, `bx2.32x128`, `bx2.48x192`, `mx2.4x32`, `mx2.16x128`, `mx2.128x1024`"
  }
}

variable "enable_high_availability" {
  type        = bool
  description = "Whether to enable high availability on the DB2 instance"
  default     = true
}

variable "enable_oracle_compatibility" {
  type        = bool
  description = "Whether to enable Oracle compatibility on the DB2 instance"
  default     = false
}
