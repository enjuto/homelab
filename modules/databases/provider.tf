provider "postgresql" {
  host            = "10.0.30.10"
  port            = 5432
  database        = "postgres"
  username        = data.vault_kv_secret_v2.admin_postgres.data["username"]
  password        = data.vault_kv_secret_v2.admin_postgres.data["password"]
  sslmode         = "disable"
  #connect_timeout = 15
}