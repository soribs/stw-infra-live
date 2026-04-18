variable "project_name" {
  description = "Project name"
  type        = string
  default     = "stewardship"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "southafricanorth"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vm_subnet_address_prefix" {
  description = "Address for VM subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "bastion_subnet_address_prefix" {
  description = "Address for Bastion subnet (/26 minimum)"
  type        = string
  default     = "10.0.255.0/26"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureadmin"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for the admin user"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B2ms"
}

variable "data_disks" {
  description = "Map of data disks to create"
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
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
