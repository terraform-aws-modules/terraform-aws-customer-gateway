# Complete Customer Gateway, VPC and VPN example

Configuration in this directory creates 2 Customer Gateways, a VPC and 2 VPN connections between CGW and VPC.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.23 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cgw"></a> [cgw](#module\_cgw) | ../../ |  |
| <a name="module_disabled_cgw"></a> [disabled\_cgw](#module\_disabled\_cgw) | ../../ |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 2.0 |
| <a name="module_vpn_gateway_1"></a> [vpn\_gateway\_1](#module\_vpn\_gateway\_1) | terraform-aws-modules/vpn-gateway/aws | ~> 2.0 |
| <a name="module_vpn_gateway_2"></a> [vpn\_gateway\_2](#module\_vpn\_gateway\_2) | terraform-aws-modules/vpn-gateway/aws | ~> 2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | List of CIDR blocks of private subnets | `list(string)` | <pre>[<br>  "10.10.11.0/24",<br>  "10.10.12.0/24",<br>  "10.10.13.0/24"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cgw_cgw_ids"></a> [cgw\_cgw\_ids](#output\_cgw\_cgw\_ids) | List of IDs of Customer Gateway |
| <a name="output_cgw_this_customer_gateway"></a> [cgw\_this\_customer\_gateway](#output\_cgw\_this\_customer\_gateway) | Map of Customer Gateway attributes |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
