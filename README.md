# AWS Customer Gateway Terraform module

Terraform module which creates AWS Customer Gateway resources on AWS.

This module has been extracted from the [VPC](https://github.com/terraform-aws-modules/terraform-aws-vpc) module, because sometimes it makes sense to reuse Customer Gateways across multiple VPC resources. Check out other related modules - [VPC](https://github.com/terraform-aws-modules/terraform-aws-vpc), [VPN Gateway](https://github.com/terraform-aws-modules/terraform-aws-vpn-gateway) and [Transit Gateway](https://github.com/terraform-aws-modules/terraform-aws-transit-gateway) for more details.

These types of resources are supported:

* [Customer Gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)

## Usage

```hcl
module "cgw" {
  source  = "terraform-aws-modules/customer-gateway/aws"
  version = "~> 1.0"

  name = "test-cgw"

  customer_gateways = {
    IP1 = {
      bgp_asn    = 65112
      ip_address = "49.33.1.162"
    },
    IP2 = {
      bgp_asn    = 65112
      ip_address = "85.38.42.93"
    }
  }

  tags = {
    Test = "maybe"
  }
}
```

## Examples

* [Complete example](https://github.com/terraform-aws-modules/terraform-aws-customer-gateway/tree/master/examples/complete) creates 2 Customer Gateways, a VPC and creates 2 VPN connections between them.

## Conditional creation

Sometimes you need to have a way to create Customer Gateway conditionally but Terraform does not allow to use `count` inside `module` block, so the solution is to specify argument `create`.

```hcl
# This CGW will not be created
module "cgw" {
  source  = "terraform-aws-modules/customer-gateway/aws"
  version = "~> 1.0"

  create = false
  # ... omitted
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.23 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create | Whether to create Customer Gateway resources | `bool` | `true` | no |
| customer\_gateways | Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address) | `map(map(any))` | `{}` | no |
| name | Name to be used on all the resources as identifier | `string` | `""` | no |
| tags | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cgw\_ids | List of IDs of Customer Gateway |
| this\_customer\_gateway | Map of Customer Gateway attributes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
