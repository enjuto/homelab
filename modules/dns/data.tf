
#Get user and password to access as admin into postgres
data "vault_kv_secret_v2" "admin_adguard" {
  mount = var.ENVIRONMENT
  name  = "adguard"
  #depends_on = [module.secrets]

}