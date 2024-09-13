locals {
  location             = "westeurope"
  project_name         = "repro-3d"
  cors_allowed_origins = ["https://repro3d.myshopify.com"]

  /*
  role_assignments = {
    # Function App
    "79037b14-df8e-4bb1-9f64-cf2a8b14b8a2" = [
      {
        scope = data.azurerm_subscription.current.id
        roles = [
          "Storage Blob Data Contributor"
        ]
      },
      {
        scope = data.azurerm_subscription.current.id
        roles = [
          "Key Vault Secrets User"
        ]
      }
    ]
  }*/
}