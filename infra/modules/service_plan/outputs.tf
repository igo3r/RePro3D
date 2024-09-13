output "name" {
  description = "The name of the Service Plan."
  value       = azurerm_service_plan.this.name
}

output "id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.this.id
}