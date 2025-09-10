variable "creator" {
  description = "tag value for creator"
  type        = string
}

variable "resource_groups" {
  description = "Map of the resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of the app service plans"
  type = map(object({
    name         = string
    sku_name     = string
    worker_count = number
    rg_key       = string
    os_type      = string
  }))
}

variable "app_services" {
  description = "Map of the app services"
  type = map(object({
    name    = string
    asp_key = string
    rg_key  = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager profile configuration"
  type = object({
    name           = string
    routing_method = string
    rg_key         = string
  })
}

variable "allow_ip_rule_name" {
  description = "Name of the allow IP access restriction rule"
  type        = string
}

variable "allow_tm_rule_name" {
  description = "Name of the allow Azure Traffic Manager service tag rule"
  type        = string
}

variable "verification_ip" {
  description = "Verification agent public IP allowed to access the Apps"
  type        = string
}
