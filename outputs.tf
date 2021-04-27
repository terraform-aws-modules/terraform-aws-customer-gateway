output "ids" {
  description = "List of IDs of Customer Gateway"
  value       = [for k, v in aws_customer_gateway.this : v.id]
}

output "customer_gateway" {
  description = "Map of Customer Gateway attributes"
  value       = aws_customer_gateway.this
}
