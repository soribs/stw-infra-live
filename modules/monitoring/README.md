# terraform-azurerm-monitoring

Creates an Azure Monitor Data Collection Rule (DCR) that streams Syslog data to a Storage Account,
associates it with a VM, and installs the Azure Monitor Agent extension.

## Usage

```hcl
module "monitoring" {
  source = "github.com/your-org/terraform-azurerm-monitoring?ref=v1.0.0"

  project_name         = "stewardship"
  environment          = "prod"
  location             = "southafricanorth"
  resource_group_name  = "rg-stewardship-prod-san"
  vm_id                = module.vm.vm_id
  vm_name              = module.vm.vm_name
  storage_account_id   = module.storage.storage_account_id
  storage_account_name = module.storage.storage_account_name
}
```
