terraform {
    required_version = ">= 0.14"
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.13.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.18.0"
    }
  }
}

