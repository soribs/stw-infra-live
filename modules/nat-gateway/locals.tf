locals {
  region_abbreviation = {
    "southafricanorth" = "san"
  }

  region      = local.region_abbreviation[var.location]
  nat_gw_name = "ngw-${var.project_name}-${var.environment}-${local.region}"

  default_tags = {
    project     = var.project_name
    environment = var.environment
  }

  tags = merge(local.default_tags, var.tags)
}
