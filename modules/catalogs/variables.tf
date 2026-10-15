variable "catalog_name" {
  type        = string
  description = "Name of the Databricks catalog"
}

variable "catalog_comment" {
  type        = string
  default     = "Managed via Terraform"
}

variable "environment" {
  type        = string
  description = "Target environment (dev, stage, prod)"
}

variable "service_principal_app_ids" {
  type        = list(string)
  default     = []
  description = "List of Application IDs for Databricks service principals"
}

variable "user_emails" {
  type        = list(string)
  default     = []
  description = "List of user emails requiring catalog access"
}