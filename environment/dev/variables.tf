variable "environments" {  
  type        = list(string)
  description = "Environment aviables to deploy services. This come from TF_VAR_example as a environment variable"
  #default     = "dev"
}

variable "services" {
  type = map(object({
    name        = string
    #user        = string
    #password    = string
    #description   = string    
    #internal      = bool
    #external      = bool
    #proxied       = bool
  }))
  description = "Services aviables in the cluster"
}

variable "postgres_users" {
  type = map(object({
    name        = string
    #user        = string
    #password    = string
  }))
  description = "postgres database users"
}

variable "ENVIRONMENT" {  
  type        = string
  description = "Environment fixed in the environment variable TF_VAR_ENVIRONMENT"
}