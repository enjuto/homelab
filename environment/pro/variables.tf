variable "domain" {  
  type = string
  description = "Public domain to expose services to internet"
}

variable "environment" {  
  type = string
  description = "Public domain to expose services to internet"
  default = "pro"
}

variable "perimeter_ip" {  
  type = string
  description = "Perimeter node IP"
}

variable "pihole_port" {  
  type = string
  description = "Port where pihole is deploy inside the perimeter node"
}

variable "services" {
  type = map(object({
    name          = string
    description   = string    
    internal      = bool
    external      = bool
    proxied       = bool
  }))
}
