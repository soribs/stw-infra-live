provider "azurerm" {
  features {}
}

module "pip" {
  source = "github.com/your-org/terraform-azurerm-public-ip?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  purpose             = "bastion"
}
