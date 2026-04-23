locals {
  region_abbreviation = {
    "southafricanorth" = "san"
  }

  region = local.region_abbreviation[var.location]

  vm_subnet_name = "snet-vm-${var.project_name}-${var.environment}-${local.region}"
  nsg_name       = "nsg-${var.project_name}-${var.environment}-${local.region}"

  default_tags = {
    project     = var.project_name
    environment = var.environment
  }

  tags = merge(local.default_tags, var.tags)
}
