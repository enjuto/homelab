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