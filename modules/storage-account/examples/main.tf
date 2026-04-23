provider "azurerm" {
  features {}
}

module "storage" {
  source = "github.com/your-org/terraform-azurerm-storage-account?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  containers = {
    "syslog" = { access_type = "private" }
  }
}
