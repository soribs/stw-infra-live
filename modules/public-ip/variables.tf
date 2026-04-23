variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Only 'southafricanorth' is permitted for this project."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "purpose" {
  description = "Purpose of the public IP used in resource name."
  type        = string
  default     = "bastion"
}

variable "allocation_method" {
  description = "IP allocation method: Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "SKU for the public IP (Basic or Standard)"
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
