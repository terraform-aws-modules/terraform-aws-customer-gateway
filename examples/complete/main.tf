provider "aws" {
  region = "eu-west-1"
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
}

module "cgw" {
  source = "../../"

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

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name = "complete"

  cidr = "10.10.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = true

  tags = {
    Owner = "user"
    Name  = "complete"
  }
}

module "vpn_gateway_1" {
  source  = "terraform-aws-modules/vpn-gateway/aws"
  version = "~> 2.0"

  vpn_gateway_id      = module.vpc.vgw_id
  customer_gateway_id = module.cgw.cgw_ids[0]

  vpc_id                       = module.vpc.vpc_id
  vpc_subnet_route_table_ids   = module.vpc.private_route_table_ids
  vpc_subnet_route_table_count = length(var.vpc_private_subnets)
}

module "vpn_gateway_2" {
  source  = "terraform-aws-modules/vpn-gateway/aws"
  version = "~> 2.0"

  vpn_gateway_id      = module.vpc.vgw_id
  customer_gateway_id = module.cgw.cgw_ids[1]

  vpc_id                       = module.vpc.vpc_id
  vpc_subnet_route_table_ids   = module.vpc.private_route_table_ids
  vpc_subnet_route_table_count = length(var.vpc_private_subnets)
}
