output "disk_ids" {
  description = "Map of disk names to their IDs"
  value       = { for k, v in azurerm_managed_disk.this : k => v.id }
}

output "disk_names" {
  description = "Map of disk keys to their resource names"
  value       = { for k, v in azurerm_managed_disk.this : k => v.name }
}
