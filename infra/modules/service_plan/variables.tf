variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location where the resources are deployed to"
  type        = string
}

variable "tags" {
  description = "This Object is used to store information about the running deployment. Resources will be tagged with it"
  type        = map(string)
  default     = {}
}

variable "config" {
  description = "App Service Plan configuration"
  type = object({
    name                   = string
    os_type                = string
    sku_name               = string
    zone_balancing_enabled = optional(bool, false)
  })
}