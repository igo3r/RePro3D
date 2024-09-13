variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure resource."
  type        = string
}

variable "location" {
  description = "The location/region where the Azure resource is created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "config" {
  description = <<EOF
  Configuration for the Log Analytics Workspace with the following attributes:
    - `name`: Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol.
    - `sku`: (Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018. Defaults to PerGB2018.
    - `retention_in_days`: (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730.
  EOF
  type = object({
    name              = string
    sku               = optional(string, "PerGB2018")
    retention_in_days = optional(number, 30)
  })
}