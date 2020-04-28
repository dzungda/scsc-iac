output "ids_app" {
  description = "List of IDs of instances"
  value       = module.app_server.id
}

output "ids_terminal" {
  description = "List of IDs of instances"
  value       = module.terminal_server.id
}

output "ids_domain" {
  description = "List of IDs of instances"
  value       = module.domain_server.id
}

output "ids_batch" {
  description = "List of IDs of instances"
  value       = module.batch_server.id
}

output "public_dns_app" {
  description = "List of public DNS names assigned to the instances"
  value       = module.app_server.public_dns
}
output "public_dns_terminal" {
  description = "List of public DNS names assigned to the instances"
  value       = module.terminal_server.public_dns
}
output "public_dns_domain" {
  description = "List of public DNS names assigned to the instances"
  value       = module.domain_server.public_dns
}
output "public_dns_batch" {
  description = "List of public DNS names assigned to the instances"
  value       = module.batch_server.public_dns
}

output "vpc_security_group_ids_app" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.app_server.vpc_security_group_ids
}

output "vpc_security_group_ids_terminal" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.terminal_server.vpc_security_group_ids
}
output "vpc_security_group_ids_domain" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.domain_server.vpc_security_group_ids
}
output "vpc_security_group_ids_batch" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.batch_server.vpc_security_group_ids
}

output "root_block_device_volume_ids_app" {
  description = "List of volume IDs of root block devices of instances"
  value       = module.app_server.root_block_device_volume_ids
}
output "root_block_device_volume_ids_terminal" {
  description = "List of volume IDs of root block devices of instances"
  value       = module.terminal_server.root_block_device_volume_ids
}
output "root_block_device_volume_domain" {
  description = "List of volume IDs of root block devices of instances"
  value       = module.domain_server.root_block_device_volume_ids
}
output "root_block_device_volume_ids_batch" {
  description = "List of volume IDs of root block devices of instances"
  value       = module.batch_server.root_block_device_volume_ids
}

output "ebs_block_device_volume_ids_app" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = module.app_server.ebs_block_device_volume_ids
}
output "ebs_block_device_volume_ids_terminal" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = module.terminal_server.ebs_block_device_volume_ids
}
output "ebs_block_device_volume_ids_domain" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = module.domain_server.ebs_block_device_volume_ids
}
output "ebs_block_device_volume_ids_batch" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = module.batch_server.ebs_block_device_volume_ids
}

output "tags_app" {
  description = "List of tags"
  value       = module.app_server.tags
}
output "tags_terminal" {
  description = "List of tags"
  value       = module.terminal_server.tags
}
output "tags_domain" {
  description = "List of tags"
  value       = module.domain_server.tags
}
output "tags_batch" {
  description = "List of tags"
  value       = module.batch_server.tags
}

output "placement_group_app" {
  description = "List of placement group"
  value       = module.app_server.placement_group
}
output "placement_group_terminal" {
  description = "List of placement group"
  value       = module.terminal_server.placement_group
}
output "placement_group_domain" {
  description = "List of placement group"
  value       = module.domain_server.placement_group
}
output "placement_group_batch" {
  description = "List of placement group"
  value       = module.batch_server.placement_group
}

output "instance_id_app" {
  description = "EC2 instance ID"
  value       = module.app_server.id[0]
}
output "instance_id_terminal" {
  description = "EC2 instance ID"
  value       = module.terminal_server.id[0]
}
output "instance_id_domain" {
  description = "EC2 instance ID"
  value       = module.domain_server.id[0]
}
output "instance_id_batch" {
  description = "EC2 instance ID"
  value       = module.batch_server.id[0]
}

output "instance_public_dns_app" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.app_server.public_dns[0]
}
output "instance_public_dns_terminal" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.terminal_server.public_dns[0]
}
output "instance_public_dns_domain" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.domain_server.public_dns[0]
}
output "instance_public_dns_batch" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.batch_server.public_dns[0]
}

output "credit_specification_app" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = module.app_server.credit_specification
}
output "credit_specification_terminal" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = module.terminal_server.credit_specification
}
output "credit_specification_domain" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = module.domain_server.credit_specification
}
output "credit_specification_batch" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = module.batch_server.credit_specification
}

output "instances_public_ips_app" {
  description = "Public IPs assigned to the EC2 instance"
  value       = module.app_server.public_ip
}
output "instances_public_ips_terminal" {
  description = "Public IPs assigned to the EC2 instance"
  value       = module.terminal_server.public_ip
}
output "instances_public_ips_domain" {
  description = "Public IPs assigned to the EC2 instance"
  value       = module.domain_server.public_ip
}
output "instances_public_ips_batch" {
  description = "Public IPs assigned to the EC2 instance"
  value       = module.batch_server.public_ip
}

