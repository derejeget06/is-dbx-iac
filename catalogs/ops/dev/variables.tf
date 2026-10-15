variable "catalog_name" {
  type = string
}

variable "schema_name" {
  type = string
}

variable "service_principal_app_ids" {
  type    = list(string)
  default = []
}

variable "user_emails" {
  type    = list(string)
  default = []
}