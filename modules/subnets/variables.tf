variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-teame-dev-01"
}

variable "subnet_count" {
  type = number
  default = 1
}

variable "vnet_name" {
  type = list(string)
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the sub net."
  default     = ["10.0.0.0/24"]
}

variable "name" {
  type = string
}