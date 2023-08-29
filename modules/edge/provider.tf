provider "cloudflare" {
  api_token = data.vault_kv_secret_v2.secret_cloudflare.data["API_KEY_ENJUCORP_COM"]
}