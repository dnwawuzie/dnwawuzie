
output "TargetGroupArntechops" {
  value = aws_lb_target_group.alb_target_group_techops.arn
}


output "AlbDns" {
  value = aws_lb.alb.dns_name
}

output "ZoneId" {
  value = aws_lb.alb.zone_id
}