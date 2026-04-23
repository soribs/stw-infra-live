# terraform-azurerm-subnet-nsg

Creates a VM Subnet, Network Security Group with dynamic rules, and associates them.

## Usage

```hcl
module "subnet_nsg" {
  source = "github.com/your-org/terraform-azurerm-subnet-nsg?ref=v1.0.0"

  project_name             = "stewardship"
  environment              = "prod"
  location                 = "southafricanorth"
  resource_group_name      = "rg-stewardship-prod-san"
  vnet_name                = "vnet-stewardship-prod-san"
  vm_subnet_address_prefix = "10.0.1.0/24"
}
```
