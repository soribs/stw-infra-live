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
  description = "ID of the Virtual Machine to associate the DCR with"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the Storage Account for Syslog destination"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "syslog_facilities" {
  description = "Syslog facilities to collect"
  type        = list(string)
  default     = ["auth", "syslog", "daemon", "kern"]
}

variable "syslog_levels" {
  description = "Syslog log levels to collect"
  type        = list(string)
  default     = ["Debug", "Info", "Notice", "Warning", "Error", "Critical", "Alert", "Emergency"]
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
