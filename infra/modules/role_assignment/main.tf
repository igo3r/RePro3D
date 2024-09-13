resource "azurerm_role_assignment" "this" {
  for_each = { for item in local.flattened_role_assignments : item.key => item.value }

  scope                            = each.value.scope
  role_definition_name             = each.value.role
  principal_id                     = each.value.principal_id
  skip_service_principal_aad_check = each.value.skip_service_principal_aad_check
}