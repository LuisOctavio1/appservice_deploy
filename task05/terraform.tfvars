creator = "luis_torres2@epam.com"

resource_groups = {
  rg1 = { name = "cmaz-y010np4n-mod5-rg-01", location = "East US" }
  rg2 = { name = "cmaz-y010np4n-mod5-rg-02", location = "West Europe" }
  rg3 = { name = "cmaz-y010np4n-mod5-rg-03", location = "Central US" }
}

app_service_plans = {
  asp1 = { name = "cmaz-y010np4n-mod5-asp-01", sku_name = "P0v3", worker_count = 2, rg_key = "rg1", os_type = "Windows" }
  asp2 = { name = "cmaz-y010np4n-mod5-asp-02", sku_name = "P1v3", worker_count = 1, rg_key = "rg2", os_type = "Windows" }
}

app_services = {
  app1 = { name = "cmaz-y010np4n-mod5-app-01", asp_key = "asp1", rg_key = "rg1" }
  app2 = { name = "cmaz-y010np4n-mod5-app-02", asp_key = "asp2", rg_key = "rg2" }
}

traffic_manager = {
  name           = "cmaz-y010np4n-mod5-traf"
  routing_method = "Performance"
  rg_key         = "rg3"
}

allow_ip_rule_name = "allow-ip"
allow_tm_rule_name = "allow-tm"
verification_ip    = "18.153.146.156/32"

