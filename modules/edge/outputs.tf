output "dns_records" {
  value = local.list_services
}

output "test" {
  value = cloudflare_record.cname_external_services
}

output "test2" {
  value = cloudflare_record.cname_internal_pro_services
}