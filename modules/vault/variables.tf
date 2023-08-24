variable "postgres_user" {
  type = map(object({
    name        = string
    #user        = string
    #password    = string
  }))
  description = "postgres database users"
}

variable "serv" {
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

variable "env" {  
  type        = list(string)
  description = "Environment aviables to deploy services"
}