variable "postgres_services" {
  type = map(object({
    name     = string
    #username = string
    #password = string
  }))
}

variable "ENVIRONMENT" {  
  type        = string
  description = "Environment fixed in the environment variable TF_VAR_ENVIRONMENT"
}
