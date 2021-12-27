variable "nodes" {
  description = "count variable"
  default = 1
}

variable "team" {
  description = "tag variable"
  default = "teame"
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        =  string
  default     = "rg-teame-dev-01"
}

variable "location" {
  description = "location of snet"
  default = "East US"
}

variable "subnet_id" {
  type = string
}

variable "storage_account_id" {
  type = string
}