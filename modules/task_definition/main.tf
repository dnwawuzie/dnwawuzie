

resource "aws_ecs_task_definition" "taskdefinition_techops" {
  family                   = "${terraform.workspace}-${var.EnvName}-task-definition-techops"
  container_definitions    = "arn:aws:iam: :679043278190:role/ecsTaskExecutionRole"
  cpu                      = var.Settings.Cpu
  memory                   = var.Settings.Memory
  task_role_arn            = var.TaskDefRole
  execution_role_arn       = var.TaskDefRole
  requires_compatibilities = ["FARGATE"]
}
