resource "azurerm_managed_disk" "this" {
  for_each = var.data_disks

  name                 = "disk-${each.key}-${var.project_name}-${var.environment}-${local.region}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = each.value.storage_type
  create_option        = "Empty"
  disk_size_gb         = each.value.size_gb
  tags                 = local.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  for_each = var.data_disks

  managed_disk_id    = azurerm_managed_disk.this[each.key].id
  virtual_machine_id = var.vm_id
  lun                = each.value.lun
  caching            = each.value.caching
}
