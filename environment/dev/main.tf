module "secrets" {
  source                      = "../../modules/vault"
  env                         = var.environments
  serv                        = var.services
  postgres_user               = var.postgres_users
  #domain                    = var.domain
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

module "databases" {
  source                      = "../../modules/databases"
  postgres_services           = var.postgres_users
  ENVIRONMENT                 = var.ENVIRONMENT
  #depends_on = [module.secrets]
}