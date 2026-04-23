provider "azurerm" {
  features {}
}

module "subnet_nsg" {
  source = "github.com/your-org/terraform-azurerm-subnet-nsg?ref=v1.0.0"

  project_name             = "stewardship"
  environment              = "dev"
  location                 = "southafricanorth"
  resource_group_name      = "rg-stewardship-dev-san"
  vnet_name                = "vnet-stewardship-dev-san"
  vm_subnet_address_prefix = "10.0.1.0/24"
}
