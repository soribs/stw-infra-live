locals {
  common = {
    project_name        = var.project_name
    environment         = var.environment
    location            = var.location
    resource_group_name = module.resource_group.resource_group_name
    tags                = var.tags
  }
}
