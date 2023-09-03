
variable "ENVIRONMENT" {  
  type        = string
  description = "Environment fixed in the environment variable TF_VAR_ENVIRONMENT"
}

variable "domain" {  
  type = string
  description = "Public domain to expose services to internet"
}
variable "PERIMETER_DEV" {  
  type        = string
  description = "Perimeter IP for production environment"
}

variable "PERIMETER_PRO" {  
  type        = string
  description = "Perimeter IP for development environment"
}

variable "PERIMETER" {  
  type        = string
  description = "Perimeter IP for environment variable TF_PERIMETER"
}

variable "services" {
  type = map(object({
    status          = bool
    name            = string
    description     = string
    dns_internal    = bool
    dns_external    = bool
    secrets         = bool
    postgres        = bool    
  }))
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