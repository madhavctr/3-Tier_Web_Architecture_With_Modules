#VPC
output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.vpc.vpc_owner_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_ids
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.natgw_ids
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.vpc.igw_arn
}

#Security Group
output "web-security_group_arn" {
  description = "The ARN of the security group"
  value       = module.web-sg.security_group_arn
}

output "web-security_group_id" {
  description = "The ID of the security group"
  value       = module.web-sg.security_group_id
}

output "db-security_group_arn" {
  description = "The ARN of the security group"
  value       = module.db-sg.security_group_arn
}

output "db-security_group_id" {
  description = "The ID of the security group"
  value       = module.db-sg.security_group_id
}

output "bastian-security_group_arn" {
  description = "The ARN of the security group"
  value       = module.bastian-sg.security_group_arn
}

output "bastian-security_group_id" {
  description = "The ID of the security group"
  value       = module.bastian-sg.security_group_id
}

#S3 bucket 
output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.s3_bucket.s3_bucket_arn
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = module.s3_bucket.s3_bucket_region
}

#DB Master 
output "db_instance_address-master" {
  description = "The address of the RDS instance"
  value       = module.db-master.db_instance_address
}

output "db_instance_arn-master" {
  description = "The ARN of the RDS instance"
  value       = module.db-master.db_instance_arn
}

output "db_instance_availability_zone-master" {
  description = "The availability zone of the RDS instance"
  value       = module.db-master.db_instance_availability_zone
}

output "db_instance_endpoint-master" {
  description = "The connection endpoint"
  value       = module.db-master.db_instance_endpoint
}

output "db_instance_engine-master" {
  description = "The database engine"
  value       = module.db-master.db_instance_engine
}

output "db_instance_engine_version_actual-master" {
  description = "The running version of the database"
  value       = module.db-master.db_instance_engine_version_actual
}

output "db_instance_id-master" {
  description = "The RDS instance ID"
  value       = module.db-master.db_instance_id
}

output "db_instance_resource_id-master" {
  description = "The RDS Resource ID of this instance"
  value       = module.db-master.db_instance_resource_id
}

output "db_instance_status-master" {
  description = "The RDS instance status"
  value       = module.db-master.db_instance_status
}

output "db_instance_name-master" {
  description = "The database name"
  value       = module.db-master.db_instance_name
}

output "db_instance_port-master" {
  description = "The database port"
  value       = module.db-master.db_instance_port
}

output "db_subnet_group_id-master" {
  description = "The db subnet group name"
  value       = module.db-master.db_subnet_group_id
}

output "db_subnet_group_arn-master" {
  description = "The ARN of the db subnet group"
  value       = module.db-master.db_subnet_group_arn
}

output "db_parameter_group_id-master" {
  description = "The db parameter group id"
  value       = module.db-master.db_parameter_group_id
}

output "db_parameter_group_arn-master" {
  description = "The ARN of the db parameter group"
  value       = module.db-master.db_parameter_group_arn
}

#DB Replica
output "db_instance_address-replica" {
  description = "The address of the RDS instance"
  value       = module.db-replica.db_instance_address
}

output "db_instance_arn-replica" {
  description = "The ARN of the RDS instance"
  value       = module.db-replica.db_instance_arn
}

output "db_instance_availability_zone-replica" {
  description = "The availability zone of the RDS instance"
  value       = module.db-replica.db_instance_availability_zone
}

output "db_instance_endpoint-replica" {
  description = "The connection endpoint"
  value       = module.db-replica.db_instance_endpoint
}

output "db_instance_engine-replica" {
  description = "The database engine"
  value       = module.db-replica.db_instance_engine
}

output "db_instance_engine_version_actual-replica" {
  description = "The running version of the database"
  value       = module.db-replica.db_instance_engine_version_actual
}

output "db_instance_id-replica" {
  description = "The RDS instance ID"
  value       = module.db-replica.db_instance_id
}

output "db_instance_resource_id-replica" {
  description = "The RDS Resource ID of this instance"
  value       = module.db-replica.db_instance_resource_id
}

output "db_instance_status-replica" {
  description = "The RDS instance status"
  value       = module.db-replica.db_instance_status
}

output "db_instance_name-replica" {
  description = "The database name"
  value       = module.db-replica.db_instance_name
}
output "db_instance_port-replica" {
  description = "The database port"
  value       = module.db-replica.db_instance_port
}

output "db_subnet_group_id-replica" {
  description = "The db subnet group name"
  value       = module.db-replica.db_subnet_group_id
}

output "db_subnet_group_arn-replica" {
  description = "The ARN of the db subnet group"
  value       = module.db-replica.db_subnet_group_arn
}

output "db_parameter_group_id-replica" {
  description = "The db parameter group id"
  value       = module.db-replica.db_parameter_group_id
}

output "db_parameter_group_arn-replica" {
  description = "The ARN of the db parameter group"
  value       = module.db-replica.db_parameter_group_arn
}

#External ALB 
output "lb_id-external" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.external-alb.lb_id
}

output "lb_arn-external" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.external-alb.lb_arn
}

output "lb_dns_name-external" {
  description = "The DNS name of the load balancer."
  value       = module.external-alb.lb_dns_name
}

output "target_group_arns-external" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.external-alb.target_group_arns
}

output "target_group_arn_suffixes-external" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = module.external-alb.target_group_arn_suffixes
}

output "target_group_names-external" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.external-alb.target_group_names
}

#Internal ALB 
output "lb_id-internal" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.internal-alb.lb_id
}

output "lb_arn-internal" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.internal-alb.lb_arn
}

output "lb_dns_name-internal" {
  description = "The DNS name of the load balancer."
  value       = module.internal-alb.lb_dns_name
}

output "target_group_arns-internal" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.internal-alb.target_group_arns
}

output "target_group_arn_suffixes-internal" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = module.internal-alb.target_group_arn_suffixes
}

output "target_group_names-internal" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.internal-alb.target_group_names
}

# EC2 bastian
output "ec2_bastian_id" {
  description = "The ID of the instance"
  value       = module.ec2_bastian.id
}

output "ec2_bastian_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_bastian.arn
}


output "ec2_bastian_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_bastian.instance_state
}

output "ec2_bastian_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_bastian.primary_network_interface_id
}

output "ec2_bastian_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_bastian.private_dns
}

output "ec2_bastian_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_bastian.public_dns
}

output "ec2_bastian_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_bastian.public_ip
}