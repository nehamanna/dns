# ----------------------------------------
# Write your Terraform module outputs here
# ----------------------------------------
output "record_set" {
  value = dns_a_record_set.www[*]
}