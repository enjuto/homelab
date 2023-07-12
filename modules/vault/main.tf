# To generate random passwords
resource "random_password" "password" {
  for_each = var.serv
  length           = 8
  special          = false
  #override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Create secret engine path
resource "vault_mount" "secrets_engine" {
  for_each  = toset(var.env)
  path      = each.value
  type      = "kv-v2"
}


# Vectorial mix with environment variables and service or portgres users
locals {
  service_secrets = distinct(flatten([
    for environment in var.env : [
      for services in var.serv : {
        environment    = environment
        services       = services
      }
    ]
  ]))
  
  postgres_secrets = distinct(flatten([
    for environment in var.env : [
      for postgres_users in var.postgres_user : {
        environment          = environment
        postgres_users       = postgres_users
      }
    ]
  ]))

}

# Create service secrets by environment
resource "vault_kv_secret_v2" "service_secrets_write" {
  for_each = { for i, k in local.service_secrets : i => k }
  mount = each.value.environment
  name = "${each.value.services["name"]}"
  data_json = jsonencode({
    username = "${each.value.services["user"]}"
    #password = "${each.value.services["password"]}"
    password  = random_password.password["${each.value.services["name"]}"].result
  })
  depends_on = [vault_mount.secrets_engine]
}

# Create postgres database secrets by environment
resource "vault_kv_secret_v2" "postgres_secrets_write" {
  for_each = { for i, k in local.postgres_secrets : i => k }
  mount       = each.value.environment
  name        = "database/${each.value.postgres_users["name"]}"
  data_json   = jsonencode({
    username  = "${each.value.postgres_users["user"]}"
    password  = "${each.value.postgres_users["password"]}"
  })
  depends_on = [vault_mount.secrets_engine]
}