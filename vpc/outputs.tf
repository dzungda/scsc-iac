output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${module.vpc.vpc_cidr_block}"
}

output "public_subnets" {
  description = "public subnet id list to be used until zipmap bug fixed"
  value       = "${module.vpc.public_subnets}"
}

output "private_subnets" {
  description = "private subnet id list to be used until zipmap bug fixed"
  value       = "${module.vpc.private_subnets}"
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = "${module.vpc.database_subnets}"
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = "${module.vpc.database_subnets_cidr_blocks}"
}

output "elasticache_subnets" {
  description = "List of IDs of elasticache subnets"
  value       = "${module.vpc.elasticache_subnets}"
}

output "elasticache_subnet_group" {
  description = "elasticache subnet group id list to be used until zipmap bug fixed"
  value       = "${module.vpc.elasticache_subnet_group}"
}

output "elasticache_subnet_group_name" {
  description = "name of database subnet groups"
  value       = "${module.vpc.elasticache_subnet_group_name}"
}

# VPC Endpoints
output "vpc_endpoint_s3_id" {
  description = "The ID of VPC endpoint for S3"
  value       =  "${module.vpc.vpc_endpoint_s3_id}"
}

output "vpc_endpoint_dynamodb_id" {
  description = "The ID of VPC endpoint for DynamoDB"
  value       = "${module.vpc.vpc_endpoint_dynamodb_id}"
}
