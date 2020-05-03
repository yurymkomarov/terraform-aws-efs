resource "random_id" "this" {
  byte_length = 1

  keepers = {
    vpc_subnets = join("", var.vpc_subnets)
  }
}

resource "aws_efs_file_system" "this" {
  creation_token   = "${var.name}-${random_id.this.hex}"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name      = var.name
    Module    = path.module
    Workspace = terraform.workspace
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_efs_mount_target" "this" {
  count = length(var.vpc_subnets)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.vpc_subnets[count.index]
  security_groups = [aws_security_group.this.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "this" {
  name        = "${var.name}-${random_id.this.hex}"
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  tags = {
    Name      = var.name
    Module    = path.module
    Workspace = terraform.workspace
  }

  lifecycle {
    create_before_destroy = true
  }
}
