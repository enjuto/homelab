<<<<<<< HEAD
#terraform {
#  required_version = ">= 1.4.0"
#  required_providers {
#    cloudflare = {
#      source  = "cloudflare/cloudflare"
#      version = "4.4.0"
#    }
#    vault = {
#      source = "hashicorp/vault"
#      version = "3.15.0"
#    }
#  }
#}
=======
terraform {
  required_version = ">= 1.4.0"
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.17.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}
>>>>>>> release/v0.1.0
