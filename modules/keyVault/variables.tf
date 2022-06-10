variable "key_vault_name" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-teame-dev-01"
}

variable "location" {
  description = "location of snet"
  type        = string
  default     = "East US"
}

variable "key_vault_count" {
  description = "key vault count function"
  type = number
  default = 1
}