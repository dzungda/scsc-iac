provider "aws" {
  region = var.region
}

locals {
  user_data = <<EOF
#!/bin/bash
echo "SCSC project!"
EOF
}

data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.default.id
  tags = {
      Name = "scsc-stg-private-ap-southeast-1a"
  }
}

data "aws_security_group" "default" {
  id = "${data.terraform_remote_state.sg.outputs.this_security_group_id}"
}


#resource "aws_eip" "this" {
#  vpc      = true
#  instance = module.ec2.id[0]
#}

#resource "aws_placement_group" "web" {
#  name     = var.placement_group_name
#  strategy = "cluster"
#}

resource "aws_kms_key" "this" {
}

resource "aws_network_interface" "this" {
  count = 1

  subnet_id = tolist(data.aws_subnet_ids.private.ids)[count.index]
}

# App server
module "app_server" {
  source = "../../modules/terraform-aws-ec2"

  instance_count = 1
 
  #ami 		= data.aws_ami.amazon_linux.id
  name          = "App_Server_1_1a"
  ami           = "ami-0869caa73f897a75b"
  instance_type = "c5.2xlarge"
  subnet_id     = tolist(data.aws_subnet_ids.private.ids)[0]
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true
  #placement_group             = aws_placement_group.web.id
  key_name = "dung.danganh"
  user_data_base64 = base64encode(local.user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 70
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 100
      encrypted   = true
      kms_key_id  = aws_kms_key.this.arn
    }
  ]

  tags = {
    "Env"      = "Private"
    "project" = "scsc-stg"
  }
}

# Domain server
module "domain_server" {
  source = "../../modules/terraform-aws-ec2"

  instance_count = 1

  name          = "Domain_Server_1_1a"
  ami           = "ami-0869caa73f897a75b"
  instance_type = "m5.large"
  subnet_id     = tolist(data.aws_subnet_ids.private.ids)[0]
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true
  #placement_group             = aws_placement_group.web.id
  key_name = "dung.danganh"
  user_data_base64 = base64encode(local.user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 70
    },
  ]

  tags = {
    "Env"      = "Private"
    "project" = "scsc-stg"
  }
}

# Terminal server
module "terminal_server" {
  source = "../../modules/terraform-aws-ec2"

  instance_count = 1

  name          = "Terminal_Server_1_1a"
  ami           = "ami-0869caa73f897a75b"
  instance_type = "m5.large"
  subnet_id     = tolist(data.aws_subnet_ids.private.ids)[0]
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true
  #placement_group             = aws_placement_group.web.id
  key_name = "dung.danganh"
  user_data_base64 = base64encode(local.user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 70
    },
  ]

  tags = {
    "Env"      = "Private"
    "project" = "scsc-stg"
  }
}

# Batch server
module "batch_server" {
  source = "../../modules/terraform-aws-ec2"

  instance_count = 1

  name          = "Batch_Server_1_1a"
  ami           = "ami-0869caa73f897a75b"
  instance_type = "c5.2xlarge"
  subnet_id     = tolist(data.aws_subnet_ids.private.ids)[0]
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true
  #placement_group             = aws_placement_group.web.id
  key_name = "dung.danganh"
  user_data_base64 = base64encode(local.user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 70
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 100
      encrypted   = true
      kms_key_id  = aws_kms_key.this.arn
    }
  ]


  tags = {
    "Env"      = "Private"
    "project" = "scsc-stg"
  }
}

