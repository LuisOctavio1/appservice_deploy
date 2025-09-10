output "id" {
  description = "Web App ID"
  value       = azurerm_windows_web_app.this.id
}
output "default_hostname" {
  description = "Default hostname of the Web App"
  value       = azurerm_windows_web_app.this.default_hostname
}
output "location" {
  description = "Web App location"
  value       = azurerm_windows_web_app.this.location
}