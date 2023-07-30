# Get the list of all secrets defined in postgres/ path by TF_VAR_ENVIRONMENT
data "vault_kv_secrets_list_v2" "list_secret_data" {
  mount = var.ENVIRONMENT
  name  = "postgres/"
  #depends_on = [vault_kv_secret_v2.postgres_user_db]
}

#Get all secrets in the environment variable TF_VAR_ENVIRONMENT
data "vault_kv_secret_v2" "secret_data" {
  for_each = var.postgres_services
  mount = var.ENVIRONMENT
  name  = "postgres/${each.value["name"]}"
  #depends_on = [vault_kv_secret_v2.postgres_user_db]
}

#Get user and password to access as admin into postgres
data "vault_kv_secret_v2" "admin_postgres" {
  mount = var.ENVIRONMENT
  name  = "postgres/admin"
}