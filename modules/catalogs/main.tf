terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}
# Fetch service principals dynamically
data "databricks_service_principal" "sp" {
  for_each       = toset(var.service_principal_app_ids)
  application_id = each.value
}

# Fetch users dynamically
data "databricks_user" "users" {
  for_each  = toset(var.user_emails)
  user_name = each.value
}



# Grant read/usage access to service principals
resource "databricks_grants" "catalog_sp_grants" {
  count = length(var.service_principal_app_ids) > 0 ? 1 : 0

  catalog = databricks_catalog.this.name

  dynamic "grant" {
    for_each = keys(data.databricks_service_principal.sp)
    content {
      principal  = grant.value
      privileges = ["USE_CATALOG", "SELECT"]
    }
  }
}

# Catalog definition
resource "databricks_catalog" "this" {
  name             = var.catalog_name
  comment          = "Managed via Terraform"
  force_destroy    = false
  managed_location = "s3://dbx-s3-bucket-947247293170-us-east-1-an"

  properties = {
    purpose = var.purpose
  }
}