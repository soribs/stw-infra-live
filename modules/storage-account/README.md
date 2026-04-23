# terraform-azurerm-storage-account

Creates an Azure Storage Account with one or more containers.

## Usage

```hcl
module "storage" {
  source = "github.com/your-org/terraform-azurerm-storage-account?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "prod"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-prod-san"
  containers = {
    "syslog" = { access_type = "private" }
  }
}
```
