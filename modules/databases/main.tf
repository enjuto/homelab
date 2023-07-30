
# variable local para crear una variable por entorno y usuario de base de datos
locals {
  services_database = distinct(flatten([
    for environment in var.environments : [
      for databases in var.postgres_services : {
        environment    = environment
        databases      = databases
      }
    ]
  ]))
}

## Create random passowords to all postgres services
#resource "random_password" "password" {
#  for_each = var.postgres_services
#  length           = 8
#  special          = false
#  #override_special = "!#$%&*()-_=+[]{}<>:?"
#}

# Creates and manages database by services within a PostgreSQL server instance.
resource "postgresql_database" "create_dbs" {
    for_each = var.postgres_services
    name              = each.value["name"]
    owner             = each.value["name"]
    template          = "template0"
    lc_collate        = "C"
    connection_limit  = -1
    allow_connections = true
    depends_on = [postgresql_role.my_roles]
}

#  The postgresql_role resource creates and manages a role on a PostgreSQL server. 
resource "postgresql_role" "my_roles" {
    for_each    = var.postgres_services
    name        = each.value["name"]
    #password   = random_password.password["${each.key}"].result
    password    = data.vault_kv_secret_v2.secret_data["${each.value["name"]}"].data["password"]
    login       = true
    #depends_on  = [vault_kv_secret_v2.postgres_user_db, random_password.password]    
}

## Store user and credentials by environment to access a postgres database
#resource "vault_kv_secret_v2" "postgres_user_db" {
#  for_each = { for i, k in local.services_database : i => k }
#  mount       = each.value.environment
#  name        = "postgres/${each.value.databases["name"]}"
#  data_json   = jsonencode({
#    username  = "${each.value.databases["name"]}"
#    password  = random_password.password["${each.value.databases["name"]}"].result
#  })
#}