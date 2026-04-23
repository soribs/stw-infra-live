locals {
  region_abbreviation = {
    "southafricanorth" = "san"
  }

  region   = local.region_abbreviation[var.location]
  dcr_name = "dcr-${var.project_name}-${var.environment}-${local.region}"

  default_tags = {
    project     = var.project_name
    environment = var.environment
  }

  tags = merge(local.default_tags, var.tags)
}
