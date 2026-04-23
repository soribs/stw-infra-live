resource "azurerm_log_analytics_workspace" "this" {
  name                = "law-${var.project_name}-${var.environment}-${local.region}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

resource "azurerm_monitor_data_collection_rule" "this" {
  name                = local.dcr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.this.id
      name                  = "syslog-la-destination"
    }
  }

  data_flow {
    streams      = ["Microsoft-Syslog"]
    destinations = ["syslog-la-destination"]
  }

  data_sources {
    syslog {
      name           = "syslog-source"
      facility_names = var.syslog_facilities
      log_levels     = var.syslog_levels
      streams        = ["Microsoft-Syslog"]
    }
  }
}

resource "azurerm_monitor_data_collection_rule_association" "this" {
  name                    = "dcra-${var.project_name}-${var.environment}-${local.region}"
  target_resource_id      = var.vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.this.id
}

resource "azurerm_virtual_machine_extension" "ama" {
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = var.vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  tags                       = local.tags
}