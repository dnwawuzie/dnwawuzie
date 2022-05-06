output "EC2RoleArn" {
  value = aws_iam_role.EC2Role.arn
}

output "TaskDefRoleArn" {
  value = aws_iam_role.TaskDefRole.arn
}

output "EC2InstanceProfile" {
  value = aws_iam_instance_profile.EC2InstanceProfile.name
}