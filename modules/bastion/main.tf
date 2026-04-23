resource "azurerm_subnet" "bastion" {
  name                 = local.bastion_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
}

resource "azurerm_bastion_host" "this" {
  name                = local.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = local.tags

  ip_configuration {
    name                 = "ipconfig-bastion"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = var.public_ip_id
  }
}
