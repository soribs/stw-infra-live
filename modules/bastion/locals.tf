locals {
  region_abbreviation = {
    "southafricanorth" = "san"
  }

  region       = local.region_abbreviation[var.location]
  bastion_name = "bas-${var.project_name}-${var.environment}-${local.region}"
  bastion_subnet_name = "AzureBastionSubnet"

  default_tags = {
    project     = var.project_name
    environment = var.environment
  }

  tags = merge(local.default_tags, var.tags)
}
