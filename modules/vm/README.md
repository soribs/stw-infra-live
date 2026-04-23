# terraform-azurerm-vm

Creates a Linux Virtual Machine with its Network Interface Card (NIC).

## Usage

```hcl
module "vm" {
  source = "github.com/your-org/terraform-azurerm-vm?ref=v1.0.0"

  project_name         = "stewardship"
  environment          = "prod"
  location             = "southafricanorth"
  resource_group_name  = "rg-stewardship-prod-san"
  subnet_id            = module.subnet_nsg.vm_subnet_id
  admin_ssh_public_key = file("~/.ssh/id_rsa.pub")
}
```
