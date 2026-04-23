# terraform-azurerm-nat-gateway

Creates a NAT Gateway, associates a Public IP, and associates it to a subnet.

## Usage

```hcl
module "nat_gateway" {
  source = "github.com/your-org/terraform-azurerm-nat-gateway?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "prod"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-prod-san"
  public_ip_id        = module.pip_nat.public_ip_id
  subnet_id           = module.subnet_nsg.vm_subnet_id
}
```
