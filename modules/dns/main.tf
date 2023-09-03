##########################################################
## Create a local variable to manage global variable  ####
##########################################################

locals {
  list_services = {
    for service, details in var.services : service => details
    if details.dns_internal && details.status 
  }
}

#################################################################
## Add records. This is needed to publish internal services  ####
#################################################################

resource "adguard_rewrite" "dns_records_pro" {
  for_each = local.list_services
  domain = "${each.value.name}.local.${var.domain}"
  answer = var.PERIMETER_PRO
}

resource "adguard_rewrite" "dns_records_dev" {
  for_each = local.list_services
  domain = "${each.value.name}.dev-local.${var.domain}"
  answer = var.PERIMETER_DEV
}

#resource "adguard_dns_config" "internal_cluster_dns" {
#  upstream_dns        = ["https://1.1.1.1/dns-query","https://dns10.quad9.net/dns-query","[/service.consul/]10.0.1.100:8600","[/service.dev.enjuto/]10.0.30.10:8600"]
#  #rate_limit          = 30
#  #cache_ttl_min       = 600
#  #cache_ttl_max       = 86400
#  #cache_optimistic    = true
#  #local_ptr_upstreams = [""]
#  local_ptr_upstreams = ["10.0.0.1"]
#}

resource "adguard_config" "internal_cluster_dns" {

  dns = {
    upstream_dns        = ["https://1.1.1.1/dns-query","https://dns10.quad9.net/dns-query","[/service.consul/]10.0.1.100:8600","[/service.dev.enjuto/]10.0.30.10:8600"]
    #rate_limit          = 30
    #cache_ttl_min       = 600
    #cache_ttl_max       = 86400
    #cache_optimistic    = true
    #blocking_mode       = "custom_ip"
    #blocking_ipv4       = "1.2.3.4"
    #blocking_ipv6       = "fe80::"
    local_ptr_upstreams = ["10.0.0.1"]
    #allowed_clients     = ["allowed-client", "192.168.200.200"]
  }
}