# 🏗️ stw-infra-live

> **Production-ready Azure infrastructure** built with Terraform — modular, reusable, and fully automated.

[![Terraform](https://img.shields.io/badge/Terraform-1.x-7B42BC?logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Ready-0078D4?logo=microsoftazure)](https://azure.microsoft.com/)
[![HCL](https://img.shields.io/badge/Language-HCL-blueviolet)](https://developer.hashicorp.com/terraform/language)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📌 Overview

`stw-infra-live` is the **live environment** of the Stewardship Azure infrastructure project.  
It composes all reusable child modules into a single, production-grade deployment — covering networking, compute, storage, security, and observability.

This project demonstrates real-world DevOps practices:
- **Infrastructure as Code** with Terraform
- **Modular architecture** — each resource is an independent, reusable module
- **Security by design** — NSG, Bastion Host, NAT Gateway, no public VM exposure
- **Observability built-in** — monitoring with Data Collection Rules linked to Storage Account

---

## 🏛️ Architecture

```
Resource Group
  └── Virtual Network (VNet)
        ├── VM Subnet + NSG
        │     ├── NAT Gateway         (outbound internet via pip-nat)
        │     └── Virtual Machine + NIC
        │           ├── Data Disks    (persistent storage)
        │           └── Monitoring    (DCR → Storage Account)
        └── AzureBastionSubnet
              └── Bastion Host        (secure RDP/SSH via pip-bastion)
```

### Why this architecture?
- **No public IP on the VM** — all access goes through Azure Bastion (zero attack surface)
- **NAT Gateway** handles outbound traffic without exposing the VM directly
- **NSG** enforces fine-grained inbound/outbound traffic rules at subnet level
- **DCR + Storage Account** enables centralized log collection and monitoring

---

## 📦 Modules

| Module | Description | Path |
|--------|-------------|------|
| `resource-group` | Azure Resource Group | `modules/resource-group` |
| `vnet` | Virtual Network | `modules/vnet` |
| `subnet-nsg` | Subnet + Network Security Group | `modules/subnet-nsg` |
| `vm` | Virtual Machine + NIC | `modules/vm` |
| `data-disks` | Managed Data Disks | `modules/data-disks` |
| `storage-account` | Storage Account | `modules/storage-account` |
| `public-ip` | Public IP Address | `modules/public-ip` |
| `nat-gateway` | NAT Gateway | `modules/nat-gateway` |
| `monitoring` | Data Collection Rule (DCR) | `modules/monitoring` |
| `bastion` | Azure Bastion Host | `modules/bastion` |

Each module is **self-contained** with its own `variables.tf`, `outputs.tf`, `locals.tf`, and usage example under `examples/`.

---

## 🚀 Quick Start

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed & authenticated
- An active Azure Subscription

### Deploy

```bash
# 1. Clone the repo
git clone https://github.com/soribs/stw-infra-live.git
cd stw-infra-live

# 2. Configure your variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

# 3. Authenticate with Azure
az login

# 4. Initialize Terraform
terraform init

# 5. Preview the changes
terraform plan

# 6. Deploy the infrastructure
terraform apply
```

### Destroy

```bash
terraform destroy
```

---

## ⚙️ Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `location` | Azure region (e.g. `eastus`) | ✅ |
| `resource_group_name` | Name of the resource group | ✅ |
| `vnet_address_space` | CIDR block for the VNet | ✅ |
| `vm_size` | Azure VM SKU (e.g. `Standard_B2s`) | ✅ |
| `admin_username` | VM administrator username | ✅ |

> See `terraform.tfvars.example` for a complete list of variables.

---

## 📁 Project Structure

```
stw-infra-live/
├── main.tf               # Root module — composes all child modules
├── variables.tf          # Input variables
├── outputs.tf            # Output values
├── locals.tf             # Local values
├── providers.tf          # Azure provider configuration
├── terraform.tfvars.example
└── modules/
    ├── resource-group/
    ├── vnet/
    ├── subnet-nsg/
    ├── vm/
    ├── data-disks/
    ├── storage-account/
    ├── public-ip/
    ├── nat-gateway/
    ├── monitoring/
    └── bastion/
```

---

## 🔐 Security Highlights

- ✅ VM has **no public IP** — access only via Azure Bastion
- ✅ **NSG rules** restrict inbound traffic at subnet level
- ✅ **NAT Gateway** for controlled outbound connectivity
- ✅ Sensitive values managed via `terraform.tfvars` (never committed)

---

## 👨‍💻 Author

**Christopher Ribeiro** — DevOps Engineer  
[GitHub](https://github.com/soribs) • [LinkedIn](https://linkedin.com/in/your-profile)

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
