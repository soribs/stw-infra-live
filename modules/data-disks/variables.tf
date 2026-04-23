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

variable "vm_id" {
  description = "ID of the virtual machine to attach disks to"
  type        = string
}

variable "data_disks" {
  description = "Map of data disks to create and attach"
  type = map(object({
    size_gb      = number
    storage_type = string
    lun          = number
    caching      = string
  }))
  default = {
    "data01" = {
      size_gb      = 64
      storage_type = "Standard_LRS"
      lun          = 0
      caching      = "ReadWrite"
    }
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
