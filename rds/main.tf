provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  id = "${data.terraform_remote_state.sg.outputs.this_rds_security_group_id}"
}

# oracle database
module "db" {
  source = "../../modules/terraform-aws-rds"

  identifier = var.db_identifier

  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_encrypted = false
  license_model     = "scsc-license"

  # Make sure that database name is capitalized, otherwise RDS will try to recreate RDS instance every time
  name                                = var.db_name
  username                            = var.db_username
  password                            = var.db_password
  port                                = var.db_port
  iam_database_authentication_enabled = false

  multi_az = var.db_multi_az

  vpc_security_group_ids = [data.aws_security_group.default.id]
  maintenance_window     = "Mon:00:00-Mon:03:00"
  backup_window          = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = "user"
    Environment = "stg"
  }

  # DB subnet group
  #subnet_ids = data.aws_subnet_ids.all.ids
  subnet_ids = "${data.terraform_remote_state.vpc.outputs.database_subnets}"

  # DB parameter group
  family = "oracle-ee-12.1"

  # DB option group
  major_engine_version = "12.1"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "scsc-stg"

  character_set_name = "AL32UTF8"

  # Database Deletion Protection
  deletion_protection = false
}
