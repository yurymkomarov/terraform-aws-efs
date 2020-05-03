output "efs_file_system" {
  value = aws_efs_file_system.this
}

output "efs_mount_target" {
  value = aws_efs_mount_target.this
}

output "security_group" {
  value = aws_security_group.this
}
