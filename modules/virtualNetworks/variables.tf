variable "location" {
  description = "location of vnet"
  default     = "East US"
}

variable "vnet_count" {
  type    = number
  default = 1
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-teame-dev-01"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "name" {
  type = string
}