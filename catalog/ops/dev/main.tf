# 1. Keep your existing catalog module
module "ops_catalog" {
  source = "../../../modules/catalogs"

  catalog_name              = var.catalog_name
  environment               = "dev"
  service_principal_app_ids = var.service_principal_app_ids
  user_emails               = var.user_emails
}

# 2. Add the schema module, depending on the catalog being created first
module "ops_schema" {
  source = "../../../modules/schemas"

  catalog_name = module.ops_catalog.catalog_id # Or var.catalog_name
  schema_name  = var.schema_name
  environment  = "dev"
  comment      = "Operational dev schema for data pipelines"

  depends_on = [module.ops_catalog]
}