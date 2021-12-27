variable "team" {
  description = "tag variable"
  default = "teame"
}

variable "nodes" {
  type = number
  default = 1
}

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


variable "repl_type" {
  description = "The replication type required for the new Storage Account. Options are LRS; GRS; RAGRS; ZRS"
  type        = string
  default     = "GRS"
}

variable "account_tier" {
  description = "The Storage Tier for the new Account. Options are 'Standard' or 'Premium'"
  type        = string
  default     = "Standard"
}

variable "storage_account_name" {
  description = "The name to assign to the new Storage Account."
  type        = string
  default     = "chaitanyachandragmail"
}

variable "container_name" {
  description = "The name to assign to the default blob container that is created."
  default     = "blob-default"
  type        = string
}

variable "datalake_v2" {
  description = "Enabled Hierarchical name space for Data Lake Storage gen 2"
  type        = bool
  default     = false
}

variable "tls_ver" {
  description = "Minimum overison of TLS that must be used to connect to the storage account"
  type        = string
  default     = "TLS1_2"
}