variable "environment" {  
  type        = list(string)
  description = "Environment aviables to deploy services"
  #default     = "dev"
}

variable "services" {
  type = map(object({
    name        = string
    user        = string
    password    = string
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
    user        = string
    password    = string
  }))
  description = "postgres database users"
}