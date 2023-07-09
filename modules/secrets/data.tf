
data "vault_kv_secret_v2" "secret_cloudflare" {
  mount = var.environment
  name  = "cloudflare"
}

data "cloudflare_zones" "zones" {
  filter {
    name = var.domain
  }
}