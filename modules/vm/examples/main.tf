provider "azurerm" {
  features {}
}

module "vm" {
  source = "github.com/your-org/terraform-azurerm-vm?ref=v1.0.0"

  project_name         = "stewardship"
  environment          = "dev"
  location             = "southafricanorth"
  resource_group_name  = "rg-stewardship-dev-san"
  subnet_id            = "/subscriptions/.../subnets/snet-vm-stewardship-dev-san"
  admin_ssh_public_key = file("~/.ssh/id_rsa.pub")
}
