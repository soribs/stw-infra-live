variable "project_name" { type = string }
variable "environment"  { type = string }
variable "location" {
  type    = string
  default = "southafricanorth"
  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Only 'southafricanorth' is permitted."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
