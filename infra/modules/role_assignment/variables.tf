variable "role_assignments" {
  description = "Map of role assignments"
  type = map(list(object({
    scope                            = string
    roles                            = list(string)
    skip_service_principal_aad_check = optional(bool, false)
  })))
}