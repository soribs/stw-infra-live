output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.this.id
}

output "public_ip_name" {
  description = "The name of the public IP"
  value       = azurerm_public_ip.this.name
}

output "public_ip_address" {
  description = "The allocated IP address"
  value       = azurerm_public_ip.this.ip_address
}
