output "this_security_group_id" {
  description = "The ID of the ec2 security group"
  value       = module.security_group.this_security_group_id
}

output "this_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.security_group.this_security_group_vpc_id
}

output "this_security_group_owner_id" {
  description = "The owner ID"
  value       = module.security_group.this_security_group_owner_id
}

output "this_security_group_name" {
  description = "The name of the ec2 security group"
  value       = module.security_group.this_security_group_name
}

output "this_security_group_description" {
  description = "The description of the ec2 security group"
  value       = module.security_group.this_security_group_description
}

output "this_rds_security_group_id" {
  description = "The ID of the rds security group"
  value       = module.rds_security_group.this_security_group_id
}

output "this_rds_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.rds_security_group.this_security_group_vpc_id
}

output "this_rds_security_group_owner_id" {
  description = "The owner ID"
  value       = module.rds_security_group.this_security_group_owner_id
}

output "this_rds_security_group_name" {
  description = "The name of the rds security group"
  value       = module.rds_security_group.this_security_group_name
}

output "this_rds_security_group_description" {
  description = "The description of the rds security group"
  value       = module.rds_security_group.this_security_group_description
}

