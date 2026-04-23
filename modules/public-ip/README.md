# terraform-azurerm-public-ip

Creates a reusable Azure Public IP address. Supports both Bastion and NAT scenarios via the `purpose` variable.

## Usage

```
module "pip_bastion" {
  source = "github.com/your-org/terraform-azurerm-public-ip?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "prod"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-prod-san"
  purpose             = "bastion"
}
```
