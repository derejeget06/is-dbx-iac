variable "catalog_name" {
  type = string
}

variable "schema_names" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "comment" {
  type    = string
  default = ""
}