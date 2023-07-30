variable "postgres_services" {
  type = map(object({
    name     = string
    #username = string
    #password = string
  }))
}

variable "environments" {  
  type        = list(string)
  description = "Environment aviables to deploy services"
  #default     = [ "pro", "dev" ]
}

variable "ENVIRONMENT" {  
  type        = string
  description = "Environment fixet in the environment variable TF_VAR_ENVIRONMENT"
}