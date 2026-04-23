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

variable "subnet_id" {
  description = "ID of the subnet for the NIC"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
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

variable "os_disk_size_gb" {
  description = "Size of the OS disk in GB"
  type        = number
  default     = 30
}

variable "os_disk_type" {
  description = "Storage type for OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "source_image" {
  description = "Source image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
