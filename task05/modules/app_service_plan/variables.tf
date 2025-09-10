variable "name" {
  description = "App service plan name"
  type        = string
}

variable "resource_group" {
  description = "App service plan resource group"
  type        = string
}

variable "location" {
  description = "App service plan location"
  type        = string

}

variable "sku_name" {
  description = "App service sku name"
  type        = string

}

variable "worker_count" {
  description = "count of the app service workers"
  type        = number

}

variable "os_type" {
  description = "App service os"
  type        = string

}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)

}