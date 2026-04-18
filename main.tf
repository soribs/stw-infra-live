# 1. Resource Group 
module "resource_group" {
  source = "git::https://github.com/soribs/terraform-azurerm-resource-group?ref=v1.0.0"

  project_name = var.project_name
  environment  = var.environment
  location     = var.location
  tags         = var.tags
}

# 2. Virtual Network 
module "vnet" {
  source = "git::https://github.com/soribs/terraform-azurerm-vnet?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  address_space       = var.vnet_address_space
  tags                = local.common.tags

  depends_on = [module.resource_group]
}

# 3. Subnets + NSG 
module "subnet_nsg" {
  source = "git::https://github.com/soribs/terraform-azurerm-subnet-nsg?ref=v1.0.0"

  project_name             = local.common.project_name
  environment              = local.common.environment
  location                 = local.common.location
  resource_group_name      = local.common.resource_group_name
  vnet_name                = module.vnet.vnet_name
  vm_subnet_address_prefix = var.vm_subnet_address_prefix
  tags                     = local.common.tags

  depends_on = [module.vnet]
}

# 4. Public IP – Bastion 
module "pip_bastion" {
  source = "git::https://github.com/soribs/terraform-azurerm-public-ip?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  purpose             = "bastion"
  tags                = local.common.tags

  depends_on = [module.resource_group]
}

# 5. Public IP – NAT Gateway 
module "pip_nat" {
  source = "git::https://github.com/soribs/terraform-azurerm-public-ip?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  purpose             = "nat"
  tags                = local.common.tags

  depends_on = [module.resource_group]
}

# 6. Bastion
module "bastion" {
  source = "git::https://github.com/soribs/terraform-azurerm-bastion?ref=v1.0.0"

  project_name                  = local.common.project_name
  environment                   = local.common.environment
  location                      = local.common.location
  resource_group_name           = local.common.resource_group_name
  vnet_name                     = module.vnet.vnet_name
  bastion_subnet_address_prefix = var.bastion_subnet_address_prefix
  public_ip_id                  = module.pip_bastion.public_ip_id
  tags                          = local.common.tags

  depends_on = [module.vnet, module.pip_bastion]
}

# 7. NAT Gateway
module "nat_gateway" {
  source = "git::https://github.com/soribs/terraform-azurerm-nat-gateway?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  public_ip_id        = module.pip_nat.public_ip_id
  subnet_id           = module.subnet_nsg.vm_subnet_id
  tags                = local.common.tags

  depends_on = [module.subnet_nsg, module.pip_nat]
}

# 8. Storage Account
module "storage" {
  source = "git::https://github.com/soribs/terraform-azurerm-storage-account?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  containers = {
    "syslog" = { access_type = "private" }
  }
  tags = local.common.tags

  depends_on = [module.resource_group]
}

# 9. Virtual Machine + NIC
module "vm" {
  source = "git::https://github.com/soribs/terraform-azurerm-vm?ref=v1.0.0"

  project_name         = local.common.project_name
  environment          = local.common.environment
  location             = local.common.location
  resource_group_name  = local.common.resource_group_name
  subnet_id            = module.subnet_nsg.vm_subnet_id
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_ssh_public_key = var.admin_ssh_public_key
  tags                 = local.common.tags

  depends_on = [module.subnet_nsg, module.nat_gateway]
}

# 10. Data Disks
module "data_disks" {
  source = "git::https://github.com/soribs/terraform-azurerm-data-disks?ref=v1.0.0"

  project_name        = local.common.project_name
  environment         = local.common.environment
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  vm_id               = module.vm.vm_id
  data_disks          = var.data_disks
  tags                = local.common.tags

  depends_on = [module.vm]
}

# 11. Monitoring (DCR)
module "monitoring" {
  source = "git::https://github.com/soribs/terraform-azurerm-monitoring?ref=v1.0.0"

  project_name         = local.common.project_name
  environment          = local.common.environment
  location             = local.common.location
  resource_group_name  = local.common.resource_group_name
  vm_id                = module.vm.vm_id
  vm_name              = module.vm.vm_name
  storage_account_id   = module.storage.storage_account_id
  storage_account_name = module.storage.storage_account_name
  tags                 = local.common.tags

  depends_on = [module.vm, module.storage]
}
