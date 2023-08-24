
#Get all secrets in the environment variable TF_VAR_ENVIRONMENT
data "vault_kv_secret_v2" "secret_data" {
  for_each = var.postgres_services
  mount = var.ENVIRONMENT
  name  = "postgres_users/${each.value["name"]}"
  #depends_on = [vault_kv_secret_v2.postgres_user_db]
  #depends_on = [module.secrets]
}

#Get user and password to access as admin into postgres
data "vault_kv_secret_v2" "admin_postgres" {
  mount = var.ENVIRONMENT
  name  = "postgres"
  #depends_on = [module.secrets]

}