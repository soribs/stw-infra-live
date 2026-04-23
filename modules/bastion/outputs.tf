output "bastion_id" {
  description = "The ID of the Bastion Host"
  value       = azurerm_bastion_host.this.id
}

output "bastion_name" {
  description = "The name of the Bastion Host"
  value       = azurerm_bastion_host.this.name
}

output "bastion_subnet_id" {
  description = "The ID of the AzureBastionSubnet"
  value       = azurerm_subnet.bastion.id
}
