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
    - `name`: Specifies the name of the Application Insights component.
    - `application_type`: Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET.
    - `sampling_percentage`: (Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. Defaults to 100.
    - `workspace_id`: (Optional) Specifies the id of a log analytics workspace resource.
  EOF
  type = object({
    name                = string
    application_type    = string
    sampling_percentage = optional(number, 100)
    workspace_id        = optional(string)
  })
}