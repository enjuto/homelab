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

variable "domain" {  
  type        = string
  description = "Lab domain for communications and web exposition"
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