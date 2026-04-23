provider "azurerm" {
  features {}
}

module "vnet" {
  source = "github.com/your-org/terraform-azurerm-vnet?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  address_space       = ["10.0.0.0/16"]
}

output "vnet_id" {
  value = module.vnet.vnet_id
}
