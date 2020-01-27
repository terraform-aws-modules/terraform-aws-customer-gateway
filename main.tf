resource "aws_customer_gateway" "this" {
  for_each = var.create ? var.customer_gateways : {}

  bgp_asn    = each.value["bgp_asn"]
  ip_address = each.value["ip_address"]
  type       = "ipsec.1"

  tags = merge(
    {
      Name = format("%s-%s", var.name, each.key)
    },
    var.tags
  )
}
