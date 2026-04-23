provider "azurerm" {
  features {}
}

module "pip_bastion" {
  source = "github.com/your-org/terraform-azurerm-public-ip?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  purpose             = "bastion"
}

module "bastion" {
  source = "github.com/your-org/terraform-azurerm-bastion?ref=v1.0.0"

  project_name                  = "stewardship"
  environment                   = "dev"
  location                      = "southafricanorth"
  resource_group_name           = "rg-stewardship-dev-san"
  vnet_name                     = "vnet-stewardship-dev-san"
  bastion_subnet_address_prefix = "10.0.255.0/26"
  public_ip_id                  = module.pip_bastion.public_ip_id
}
