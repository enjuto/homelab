# output "vpc_ids" {
#   value = {
#     for k, v in aws_vpc.example : k => v.id
#   }
# 
#   # The VPCs aren't fully functional until their
#   # internet gateways are running.
#   depends_on = [aws_internet_gateway.example]
# }

#output test_list {
###value = "${data.vault_generic_secret.srekv1.data["Name"]}"
#    #value = data.vault_kv_secret_v2.secret_data.data["POSTGRES_PASSWORD"]
#    #for_each = var.DB
#    sensitive = true
#    #value = data.vault_kv_secret_v2.secret_data.data["username"]
#    value = data.vault_kv_secrets_list_v2.list_secret_data
#}
#

output test_secret2 {
##value = "${data.vault_generic_secret.srekv1.data["Name"]}"
    #value = data.vault_kv_secret_v2.secret_data.data["POSTGRES_PASSWORD"]
    #sensitive = false
    value = var.ENVIRONMENT
    #value = data.vault_kv_secret_v2.secret_data.data["username"]
    #value = data.vault_kv_secret_v2.secret_data
    #value = data.vault_kv_secret_v2.admin_postgres.data["password"]
}
