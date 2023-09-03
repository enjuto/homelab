terraform {
    required_version = ">= 0.14"
  required_providers {
    adguard = {
      source = "gmichels/adguard"
      version = "0.7.2"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.18.0"
    }
  }
}