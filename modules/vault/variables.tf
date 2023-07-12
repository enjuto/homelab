<<<<<<< HEAD
#
#variable "domain" {  
#  type = string
#  description = "Public domain to expose services to internet"
#}
#
#variable "environment" {  
#  type = string
#  description = "Public domain to expose services to internet"
#}
#
#variable "services" {
#  type = map(object({
#    name          = string
#    description   = string
#    internal      = bool
#    external      = bool
#    proxied       = bool
#  }))
#}
=======
variable "env" {  
  type        = list(string)
  description = "Environment aviables to deploy services"

}

variable "postgres_user" {
  type = map(object({
    name        = string
    user        = string
    password    = string
  }))
  description = "postgres database users"
}

variable "serv" {
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
>>>>>>> release/v0.1.0
