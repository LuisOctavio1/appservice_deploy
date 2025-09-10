variable "name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Resource group location"
  type        = string
}

variable "tags" {
  description = "Resource groups tags"
  type        = map(string)
}