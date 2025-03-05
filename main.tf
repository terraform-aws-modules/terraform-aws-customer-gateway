resource "aws_customer_gateway" "this" {
  for_each = var.create ? var.customer_gateways : {}

  bgp_asn         = try(each.value["bgp_asn"], null)
  certificate_arn = try(each.value["certificate_arn"], null)
  ip_address      = try(each.value["ip_address"], null)
  device_name     = try(each.value["device_name"], null)
  type            = "ipsec.1"

  tags = merge(
    {
      Name = format("%s-%s", var.name, each.key)
    },
    var.tags
  )
}
