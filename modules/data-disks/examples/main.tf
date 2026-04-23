provider "azurerm" {
  features {}
}

module "data_disks" {
  source = "github.com/your-org/terraform-azurerm-data-disks?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  vm_id               = "/subscriptions/.../virtualMachines/vm-stewardship-dev-san"
  data_disks = {
    "data01" = { size_gb = 64, storage_type = "Standard_LRS", lun = 0, caching = "ReadWrite" }
  }
}
