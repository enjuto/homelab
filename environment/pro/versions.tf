terraform {
    required_version = ">= 0.14"
  required_providers {
#    postgresql = {
#      source = "cyrilgdn/postgresql"
#      version = "1.17.1"
#    }
    vault = {
      source = "hashicorp/vault"
      version = "3.15.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.4.0"
    }
    pihole = {
      source = "ryanwholey/pihole"
      version = "0.0.12"
    }
  }
}
