variable "name" {
  description = "Traffic manager name"
  type        = string

}

variable "resource_group" {
  description = "Traffic manager resource group"
  type        = string
}

variable "routing_method" {
  description = "Traffic routing method"
  type        = string

}

variable "endpoints" {
  description = "Map of the endpoints with target resource ids and locations"
  type = map(object({
    name               = string
    target_resource_id = string
  }))
}

variable "tags" {
  description = "Traffic manager tags"
  type        = map(string)

}