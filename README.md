# stw-infra-live

Live production environment for Stewardship Azure infrastructure.
Composes all child modules, pinned to v1.0.0.

## Architecture

```
Resource Group
  └── VNet
        ├── VM Subnet + NSG
        │     ├── NAT Gateway (pip-nat)
        │     └── VM + NIC
        │           ├── Data Disks
        │           └── Monitoring (DCR → Storage Account)
        └── AzureBastionSubnet
              └── Bastion Host (pip-bastion)
```

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

terraform init
terraform plan
terraform apply
```

## Module versions

All modules are pinned to `v1.0.0` via GitHub source URLs.
