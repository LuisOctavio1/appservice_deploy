resource "azurerm_windows_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group
  service_plan_id     = var.service_plan_id
  location            = var.location
  https_only          = true
  tags                = var.tags
  site_config {
    always_on = true
    dynamic "ip_restriction" {
      for_each = var.ip_allow_rules
      content {
        name       = ip_restriction.value.name
        action     = "Allow"
        priority   = ip_restriction.value.priority
        ip_address = ip_restriction.value.ip_address
      }
    }
    dynamic "ip_restriction" {
      for_each = var.service_tag_allow_rules
      content {
        name        = ip_restriction.value.name
        action      = "Allow"
        priority    = ip_restriction.value.priority
        service_tag = ip_restriction.value.service_tag
      }

    }

    ip_restriction_default_action = "Deny"
  }

}