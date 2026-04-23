variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region"
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

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "bastion_subnet_address_prefix" {
  description = "Address prefix for AzureBastionSubnet (/26 or larger)"
  type        = string
  default     = "10.0.255.0/26"
}

variable "public_ip_id" {
  description = "ID of the Public IP to associate with the Bastion"
  type        = string
}

variable "sku" {
  description = "SKU of the Bastion host (Basic or Standard)"
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
