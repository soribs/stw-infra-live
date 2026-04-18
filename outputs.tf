output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.resource_group_name
}

output "vnet_id" {
  description = "VNet ID"
  value       = module.vnet.vnet_id
}

output "vm_id" {
  description = "VM ID"
  value       = module.vm.vm_id
}

output "vm_private_ip" {
  description = "VM private IP address"
  value       = module.vm.private_ip_address
}

output "storage_account_name" {
  description = "Storage account name"
  value       = module.storage.storage_account_name
}

output "dcr_id" {
  description = "Data Collection Rule ID"
  value       = module.monitoring.dcr_id
}
