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