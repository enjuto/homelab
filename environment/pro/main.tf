module "dns_public" {
  source                    = "../../modules/dns_public"
  domain                    = var.domain
  services                  = var.services
  environment               = var.environment
  #APP_NAME                  = var.APP_NAME
  #ENV                       = var.ENV
  #AWS_REGION                = var.AWS_REGION
  #HOSTED_ZONE_ID            = var.HOSTED_ZONE_ID
  #API_RECORD_ADDRESS        = module.scaling.alb-dns-name
  #API_ZONE_ID               = module.scaling.alb-zone-id
  #WEB_CLIENT_RECORD_ADDRESS = module.storage.web-client-website-domain
  #WEB_CLIENT_HOSTED_ZONE    = module.storage.web-client-hosted-zone
  #WEB_ADMIN_RECORD_ADDRESS  = module.storage.web-admin-website-domain
  #WEB_ADMIN_HOSTED_ZONE     = module.storage.web-admin-hosted-zone
  #DOMAIN                    = var.DOMAIN
}

module "dns_private" {
  source                    = "../../modules/dns_private"
  domain                    = var.domain
  services                  = var.services
  environment               = var.environment
  perimeter_ip              = var.perimeter_ip
  pihole_port               = var.pihole_port
}

module "networking" {
  source                    = "../../modules/networking"
  domain                    = var.domain
  services                  = var.services
  environment               = var.environment
  perimeter_ip              = var.perimeter_ip
  pihole_port               = var.pihole_port
}