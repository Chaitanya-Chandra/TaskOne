variable "resource_group" {
  default = "rg-teame-dev-01"
}

variable "location" {
  default = "East US"
}

variable "environment" {
  default = "dev"
}

variable "department" {
  default = "cloudops"
}

variable "team_name" {
  default = "teame"
}

variable "created_date" {
  default = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

