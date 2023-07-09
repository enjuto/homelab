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
  }
}
