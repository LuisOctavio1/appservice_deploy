locals {
  common_tags = { Creator = var.creator }
}

module "resource_group" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
  tags     = local.common_tags
}

module "app_service_plan" {
  source         = "./modules/app_service_plan"
  for_each       = var.app_service_plans
  name           = each.value.name
  resource_group = module.resource_group[each.value.rg_key].name
  location       = module.resource_group[each.value.rg_key].location
  sku_name       = each.value.sku_name
  worker_count   = each.value.worker_count
  os_type        = each.value.os_type
  tags           = local.common_tags
}

locals {
  ip_allow_rules = [
    {
      name       = var.allow_ip_rule_name
      priority   = 100
      ip_address = var.verification_ip
    }
  ]
  service_tag_allow_rules = [
    {
      name        = var.allow_tm_rule_name
      priority    = 110
      service_tag = "AzureTrafficManager"
    }
  ]
}


module "app_service" {
  source                  = "./modules/app_service"
  for_each                = var.app_services
  name                    = each.value.name
  resource_group          = module.resource_group[each.value.rg_key].name
  location                = module.resource_group[each.value.rg_key].location
  service_plan_id         = module.app_service_plan[each.value.asp_key].id
  ip_allow_rules          = local.ip_allow_rules
  service_tag_allow_rules = local.service_tag_allow_rules
  tags                    = local.common_tags

}

locals {
  tm_endpoints = {
    for k, app in module.app_service :
    k => {
      name               = "ep-${k}"
      target_resource_id = app.id
      endpoint_location  = app.location
    }
  }
}

module "traffic_manager" {
  source         = "./modules/traffic_manager"
  name           = var.traffic_manager.name
  resource_group = module.resource_group[var.traffic_manager.rg_key].name
  routing_method = var.traffic_manager.routing_method
  endpoints      = local.tm_endpoints
  tags           = local.common_tags
}


