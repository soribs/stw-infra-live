provider "azurerm" {
  features {}
}

module "nat_gateway" {
  source = "github.com/your-org/terraform-azurerm-nat-gateway?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "dev"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-dev-san"
  public_ip_id        = "/subscriptions/.../publicIPAddresses/pip-nat-stewardship-dev-san"
  subnet_id           = "/subscriptions/.../subnets/snet-vm-stewardship-dev-san"
}
