# Create admin policy to nomad
resource "vault_policy" "vault_admin" {  
  name   = "vault_admin"
  policy = file("${path.module}/vault_admin_policy.hcl")
}

# To generate random passwords for services
resource "random_password" "password_service" {
  for_each = var.serv
  length           = 8
  special          = false
  #override_special = "!#$%&*()-_=+[]{}<>:?"
}

# To generate random passwords for postgres user
resource "random_password" "password_postgres" {
  for_each = var.postgres_user
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
#
# Create service secrets by environment
resource "vault_kv_secret_v2" "service_secrets_write" {
  for_each = { for i, k in local.service_secrets : i => k }
  mount = each.value.environment
  name = "${each.value.services["name"]}"
  data_json = jsonencode({
    name = "${each.value.services["name"]}"
    password  = random_password.password_service["${each.value.services["name"]}"].result
    #If we want to pass the password as variable
    #password = "${each.value.services["password"]}"
  })
  depends_on = [vault_mount.secrets_engine]
}


# Store user and credentials by environment to access a postgres database
resource "vault_kv_secret_v2" "postgres_secrets_write" {
  for_each = { for i, k in local.postgres_secrets : i => k }
  mount       = each.value.environment
  name        = "postgres_users/${each.value.postgres_users["name"]}"
  data_json   = jsonencode({
    name  = "${each.value.postgres_users["name"]}"
    #password  = "${each.value.postgres_users["password"]}"
    #password   = random_password.password["${each.key}"].result
    password   = random_password.password_postgres["${each.value.postgres_users["name"]}"].result
  })
  depends_on = [vault_mount.secrets_engine]
}
#
