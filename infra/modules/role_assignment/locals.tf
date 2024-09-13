locals {
  flattened_role_assignments = flatten([
    for principal_id, assignments in var.role_assignments : [
      for assignment in assignments : [
        for role in assignment.roles : {
          key = "${principal_id}-${assignment.scope}-${role}"
          value = {
            scope                            = assignment.scope
            role                             = role
            principal_id                     = principal_id
            skip_service_principal_aad_check = assignment.skip_service_principal_aad_check
          }
        }
      ]
    ]
  ])
}