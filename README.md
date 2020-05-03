# AWS EFS

This module provides AWS EFS resources:
- AWS EFS filesystem
- AWS EFS mount target
- security group

# Input variables
- `name` - Name that will be used in resources names and tags
- `vpc_id` - The identifier of the VPC in which to create the security group
- `vpc_subnets` - A list of subnet IDs to launch resources in
- `vpc_cidr_block` - The VPC CIDR IP range for security group ingress rule for access to AWS EFS storage

# Output variables
- `efs_file_system`
    - `arn` - Amazon Resource Name of the filesystem
    - `id` - The ID that identifies the filesystem
    - `dns_name` - The DNS name for the filesystem
- `efs_mount_target`
    - `id` - The ID of the mount target
    - `dns_name` - The DNS name for the given subnet/AZ
    - `file_system_arn` - Amazon Resource Name of the filesystem
    - `network_interface_id` - The ID of the network interface that Amazon EFS created when it created the mount target
- `security_group`
    - `id` - The ID of the security group
    - `arn` - The ARN of the security group
    - `vpc_id` - The VPC ID
    - `owner_id` - The owner ID
    - `name` - The name of the security group
    - `description` - The description of the security group
    - `ingress` - The ingress rules
    - `egress` - The egress rules
