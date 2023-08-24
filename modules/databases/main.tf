
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
    depends_on  = [data.vault_kv_secret_v2.secret_data]    
}