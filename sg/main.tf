provider "aws" {
  region = var.region
}

# Data sources to get VPC and default security group details
data "aws_vpc" "default" {
  id = var.vpc_id
}


# Sg for ec2 instance
module "security_group" {
  source  = "../../modules/terraform-aws-sg"

  name        = "ec2-scsc-stg"
  description = "Security group for EC2 instance in scsc pj"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      description = "Ec2 instance rule"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules        = ["all-all"]
}

# sg for rds instance
module "rds_security_group" {
  source  = "../../modules/terraform-aws-sg"

  name        = "oracle-scsc-stg"
  description = "Security group for rds instance"
  vpc_id      = data.aws_vpc.default.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 1152
      to_port     = 1152
      protocol    = "tcp"
      description = "rds-oracle instance rule"
      cidr_blocks = ""
    }
  ]
#  egress_rules        = ["all-all"]
}

