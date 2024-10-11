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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.40 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cgw"></a> [cgw](#module\_cgw) | ../../ | n/a |
| <a name="module_disabled_cgw"></a> [disabled\_cgw](#module\_disabled\_cgw) | ../../ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.0 |
| <a name="module_vpn_gateway_1"></a> [vpn\_gateway\_1](#module\_vpn\_gateway\_1) | terraform-aws-modules/vpn-gateway/aws | ~> 3.0 |
| <a name="module_vpn_gateway_2"></a> [vpn\_gateway\_2](#module\_vpn\_gateway\_2) | terraform-aws-modules/vpn-gateway/aws | ~> 3.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | List of CIDR blocks of private subnets | `list(string)` | <pre>[<br/>  "10.10.11.0/24",<br/>  "10.10.12.0/24",<br/>  "10.10.13.0/24"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway"></a> [customer\_gateway](#output\_customer\_gateway) | Map of Customer Gateway attributes |
| <a name="output_ids"></a> [ids](#output\_ids) | List of IDs of Customer Gateway |
<!-- END_TF_DOCS -->
