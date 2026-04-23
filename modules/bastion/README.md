# terraform-azurerm-bastion

Creates an Azure Bastion Host and its dedicated subnet.

## Usage

```hcl
module "bastion" {
  source = "github.com/your-org/terraform-azurerm-bastion?ref=v1.0.0"

  project_name                  = "stewardship"
  environment                   = "prod"
  location                      = "southafricanorth"
  resource_group_name           = "rg-stewardship-prod-san"
  vnet_name                     = "vnet-stewardship-prod-san"
  bastion_subnet_address_prefix = "10.0.255.0/26"
  public_ip_id                  = module.pip_bastion.public_ip_id
}
```
