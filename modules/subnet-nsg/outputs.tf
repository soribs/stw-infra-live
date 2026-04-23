output "vm_subnet_id" {
  description = "The ID of the VM subnet"
  value       = azurerm_subnet.vm.id
}

output "vm_subnet_name" {
  description = "The name of the VM subnet"
  value       = azurerm_subnet.vm.name
}

output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.this.id
}

output "nsg_name" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.this.name
}
