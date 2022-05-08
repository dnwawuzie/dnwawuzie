

resource "aws_ecs_service" "techops" {
  name                = var.Name
  cluster             = var.ECSClusterName
  launch_type         = "FARGATE"
  task_definition     = var.TaskDefinition
  desired_count       = var.Settings.Services.techops.DesiredCount
  scheduling_strategy = var.Settings.Services.techops.SchedulongStrategy

  load_balancer {
    target_group_arn = var.TargetGroupArntechops
    container_name   = "flask"
    container_port   = 80
  }
  deployment_controller {
    type = "ECS"
  }
  network_configuration {
    subnets          = var.subnet_id
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }
}

