variable "secret_count" {
  description = "key vault count function"
  default = 1
  type = number
}

variable "key_vault_secret_name" {
  description = "name of the key vault"
  type = string
}

variable "value" {
  description = "secret value"
  type = list(string)
}

variable "key_vault_id" {
  description = "key vault id"
  type = list(string)
}