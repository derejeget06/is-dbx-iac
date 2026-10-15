resource "databricks_schema" "this" {
  for_each     = toset(var.schema_names)
  catalog_name = var.catalog_name
  name         = each.value
  comment      = var.comment
}