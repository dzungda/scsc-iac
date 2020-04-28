provider "aws" {
  region  = var.region
}

module "vpc" {
  source = "https://git.vti.com.vn/vticloud/vti_cloud_iac/-/tree/master/modules/terraform-aws-vpc"

  name = var.name

  cidr = var.cidr
  azs = var.azs
# azs             = "${element([var.azs],1)}"
  private_subnets = var.private_subnets
# public_subnets  = ["10.0.101.0/24"]
  database_subnets  = var.database_subnet
  create_database_subnet_route_table    = true  

# enable_nat_gateway = true
# single_nat_gateway = true

  enable_ipv6 = false
# enable_s3_endpoint = true
  private_subnet_tags = {
    scsc = "${var.private_subnet_tags}"
  }
  enable_vpn_gateway = true
  
#  public_subnet_tags = {
#    Name = "${var.public_subnet_tags}"
#  }

  tags = {
    Owner       = "user"
    Environment = "stg"
  }

  vpc_tags = {
    Name = var.vpc-name
  }
}
