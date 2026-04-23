locals {
  region_abbreviation = {
    "southafricanorth" = "san"
  }

  region = local.region_abbreviation[var.location]

  # Storage account names: lowercase, no hyphens, max 24 chars
  sa_name = lower(replace("st${var.project_name}${var.environment}${local.region}", "-", ""))

  default_tags = {
    project     = var.project_name
    environment = var.environment
  }

  tags = merge(local.default_tags, var.tags)
}
