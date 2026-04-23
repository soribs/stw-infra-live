# terraform-azurerm-vnet

Creates an Azure Virtual Network following CAF naming conventions.

## Usage

```
module "vnet" {
  source = "github.com/your-org/terraform-azurerm-vnet?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "prod"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-prod-san"
  address_space       = ["10.0.0.0/16"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| project_name | Name of the project | string | - | yes |
| environment | Environment name | string | - | yes |
| location | Azure region | string | southafricanorth | no |
| resource_group_name | Resource group name | string | - | yes |
| address_space | VNet address space | list(string) | ["10.0.0.0/16"] | no |
| tags | Resource tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet_id | The VNet resource ID |
| vnet_name | The VNet name |
| vnet_address_space | The VNet address space |
