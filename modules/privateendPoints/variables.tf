variable "nodes" {
  description = "count function"
  type        = number
  default     = 1
}

variable "team" {
  description = "tag variable"
  type        = string
  default     = "teame"
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

variable "subnet_id" {
  description = "incoming subnet Id variables"
  type        = list(string)
}

variable "storage_account_id" {
  description = "incoming storage id variables"
  type        = list(string)
}