# terraform-azurerm-data-disks

Creates and attaches managed data disks to a Virtual Machine.

## Usage

```hcl
module "data_disks" {
  source = "github.com/your-org/terraform-azurerm-data-disks?ref=v1.0.0"

  project_name        = "stewardship"
  environment         = "prod"
  location            = "southafricanorth"
  resource_group_name = "rg-stewardship-prod-san"
  vm_id               = module.vm.vm_id
  data_disks = {
    "data01" = { size_gb = 128, storage_type = "Standard_LRS", lun = 0, caching = "ReadWrite" }
    "data02" = { size_gb = 64,  storage_type = "Standard_LRS", lun = 1, caching = "ReadOnly"  }
  }
}
```
