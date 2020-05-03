terraform {
  experiments = [variable_validation]
}

variable "name" {
  type        = string
  description = "Name that will be used in resources names and tags."
  default     = "terraform-aws-efs"
}

variable "vpc_id" {
  type        = string
  description = "The identifier of the VPC in which to create the security group."
}

variable "vpc_subnets" {
  type        = list(string)
  description = "A list of subnet IDs to launch resources in."
}

variable "vpc_cidr_block" {
  type        = string
  description = "The VPC CIDR IP range for security group ingress rule for access to AWS EFS storage."

  validation {
    condition     = can(regex("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(0|[1-9]|1[0-9]|2[0-9]|3[0-2]))$", var.vpc_cidr_block))
    error_message = "CIDR parameter must be in the form x.x.x.x/0-32."
  }
}
