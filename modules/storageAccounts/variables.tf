variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg-teame-dev-01"
}

variable "location" {
  description = "location of snet"
  default     = "East US"
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

variable "name" {
  description = "name of the storage account"
  type        = string
}

variable "storage_account_count" {
  description = "number of storage accounts"
  default     = 1
  type        = number
}