provider "adguard" {
  host     = "${var.PERIMETER}:8053"
  #host     = "adguard.local.enjucorp.com"
  username = data.vault_kv_secret_v2.admin_adguard.data["user"]
  password = data.vault_kv_secret_v2.admin_adguard.data["password"]
  scheme   = "http" # defaults to https
  timeout  = 5      # in seconds, defaults to 10
}
