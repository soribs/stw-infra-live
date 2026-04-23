resource "azurerm_storage_account" "this" {
  name                     = local.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  min_tls_version          = "TLS1_2"
    https_traffic_only_enabled = true

  tags = local.tags
}

resource "azurerm_storage_container" "this" {
  for_each = var.containers

  name                  = each.key
  storage_account_id  = azurerm_storage_account.this.id
  container_access_type = each.value.access_type
}
