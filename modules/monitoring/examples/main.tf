provider "azurerm" {
  features {}
}

module "monitoring" {
  source = "github.com/your-org/terraform-azurerm-monitoring?ref=v1.0.0"

  project_name         = "stewardship"
  environment          = "dev"
  location             = "southafricanorth"
  resource_group_name  = "rg-stewardship-dev-san"
  vm_id                = "/subscriptions/.../virtualMachines/vm-stewardship-dev-san"
  vm_name              = "vm-stewardship-dev-san"
  storage_account_id   = "/subscriptions/.../storageAccounts/ststewardshipdevsan"
  storage_account_name = "ststewardshipdevsan"
}
