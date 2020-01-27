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
## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| vpc\_private\_subnets | n/a | `list(string)` | <pre>[<br>  "10.10.11.0/24",<br>  "10.10.12.0/24",<br>  "10.10.13.0/24"<br>]<br></pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| cgw\_cgw\_ids | List of IDs of Customer Gateway |
| cgw\_this\_customer\_gateway | Map of Customer Gateway attributes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
