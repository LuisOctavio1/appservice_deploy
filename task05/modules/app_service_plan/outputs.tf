output "id" {
  description = "App service plan id"
  value       = azurerm_service_plan.this.id

}

output "name" {
  description = "App service plan name"
  value       = azurerm_service_plan.this.name

}

output "location" {
  description = "app service location"
  value       = azurerm_service_plan.this.location

}