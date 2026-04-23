output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.name
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "Private IP of the VM"
  value       = azurerm_network_interface.this.private_ip_address
}

output "vm_principal_id" {
  description = "The principal ID of the VM system-assigned identity"
  value       = azurerm_linux_virtual_machine.this.identity[0].principal_id
}
