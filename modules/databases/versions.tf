terraform {
    required_version = ">= 0.14"
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.20.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.18.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

