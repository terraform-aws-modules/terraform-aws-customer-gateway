# AWS Customer Gateway Terraform module

Terraform module which creates AWS Customer Gateway resources on AWS.

This module has been extracted from the [VPC](https://github.com/terraform-aws-modules/terraform-aws-vpc) module, because sometimes it makes sense to reuse Customer Gateways across multiple VPC resources. Check out other related modules - [VPC](https://github.com/terraform-aws-modules/terraform-aws-vpc), [VPN Gateway](https://github.com/terraform-aws-modules/terraform-aws-vpn-gateway) and [Transit Gateway](https://github.com/terraform-aws-modules/terraform-aws-transit-gateway) for more details.

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
      device_name = "something"
    }
  }

  tags = {
    Test = "maybe"
  }
}
```

## Examples

- [Complete example](https://github.com/terraform-aws-modules/terraform-aws-customer-gateway/tree/master/examples/complete) creates 2 Customer Gateways, a VPC and creates 2 VPN connections between them.

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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_customer_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create Customer Gateway resources | `bool` | `true` | no |
| <a name="input_customer_gateways"></a> [customer\_gateways](#input\_customer\_gateways) | Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address) | `map(map(any))` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all the resources as identifier | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway"></a> [customer\_gateway](#output\_customer\_gateway) | Map of Customer Gateway attributes |
| <a name="output_ids"></a> [ids](#output\_ids) | List of IDs of Customer Gateway |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-customer-gateway/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-customer-gateway/tree/master/LICENSE) for full details.
