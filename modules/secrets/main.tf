#################################################################
### Add fixed A records. This is needed for the rest of them ####
#################################################################
#
#resource "cloudflare_record" "a_record" {
  #name    = var.domain
  #proxied = true
  #ttl     = 1
  #type    = "A"
  #value   = "8.8.8.8" # - No need to add it, this is updated by batch service and change dynamically when the ISP change the public IP
  #zone_id = data.cloudflare_zones.zones.zones[0].id
#}
#resource "cloudflare_record" "cname_record_www" {
  #name    = "www"
  #proxied = true
  #ttl     = 1
  #type    = "CNAME"
  #value   = var.domain
  #zone_id = data.cloudflare_zones.zones.zones[0].id
#}
#
########################################################################
### Add CNAME records. This is needed to publish internal services  ####
########################################################################
#
#resource "cloudflare_record" "cname_records" {
  #for_each = { for i, k in var.services : i => k if k.external }
  #name         = each.value.name
  #proxied      = each.value.proxied
  #ttl          = 1
  #type         = "CNAME"
  #value        = var.domain
  #zone_id      = data.cloudflare_zones.zones.zones[0].id
#}
#
##########################################################
### Services by cloudflare to activate resend emails  ####
##########################################################
#
##resource "cloudflare_record" "terraform_managed_resource_8ba3abc2ce4df2b69e640a1885b811a4" {
##  name     = "var.domain"
##  priority = 53
##  proxied  = false
##  ttl      = 1
##  type     = "MX"
##  value    = "route3.mx.cloudflare.net"
##  zone_id  = ""
##}
##
##resource "cloudflare_record" "terraform_managed_resource_3bb4e1452bbaeb5366c41ef84354d0bc" {
##  name     = "var.domain"
##  priority = 99
##  proxied  = false
##  ttl      = 1
##  type     = "MX"
##  value    = "route2.mx.cloudflare.net"
##  zone_id  = ""
##}
##
##resource "cloudflare_record" "terraform_managed_resource_762c6b921291eaf7b5b8c0432f720805" {
##  name     = "var.domain"
##  priority = 33
##  proxied  = false
##  ttl      = 1
##  type     = "MX"
##  value    = "route1.mx.cloudflare.net"
##  zone_id  = ""
##}
##
##resource "cloudflare_record" "terraform_managed_resource_55dad3c9fdd4174189fa12d1483cc5c1" {
##  name    = "var.domain"
##  proxied = false
##  ttl     = 1
##  type    = "TXT"
##  value   = "v=spf1 include:_spf.mx.cloudflare.net ~all"
##  zone_id = ""
##}
#


