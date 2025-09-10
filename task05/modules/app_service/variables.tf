variable "name" {
  description = "Windows Web App name"
  type        = string
}
variable "resource_group" {
  description = "Resource Group name"
  type        = string
}
variable "location" {
  description = "Location"
  type        = string
}
variable "service_plan_id" {
  description = "Service Plan ID"
  type        = string
}
variable "ip_allow_rules" {
  description = "List of IP allow rules"
  type = list(object({
    name       = string
    priority   = number
    ip_address = string
  }))
}
variable "service_tag_allow_rules" {
  description = "List of service tag allow rules"
  type = list(object({
    name        = string
    priority    = number
    service_tag = string
  }))
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}