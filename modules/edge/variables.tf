#variable "postgres_services" {
#  type = map(object({
#    name     = string
#    #username = string
#    #password = string
#  }))
#}
#
variable "ENVIRONMENT" {  
  type        = string
  description = "Environment fixed in the environment variable TF_VAR_ENVIRONMENT"
}

variable "domain" {  
  type = string
  description = "Public domain to expose services to internet"
}

variable "services" {  
  type = list(string)
  description = "Public domain to expose services to internet"
}

#variable "services" {
#  type = map(object({
#    name          = string
#    description   = string
#    internal      = bool
#    external      = bool
#    proxied       = bool
#  }))
#}