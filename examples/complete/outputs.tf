output "cgw_cgw_ids" {
  description = "List of IDs of Customer Gateway"
  value       = module.cgw.cgw_ids
}

output "cgw_this_customer_gateway" {
  description = "Map of Customer Gateway attributes"
  value       = module.cgw.this_customer_gateway
}
