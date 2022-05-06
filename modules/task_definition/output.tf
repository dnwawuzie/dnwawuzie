
output "TaskDefinitiontechops" {
  value = aws_ecs_task_definition.taskdefinition_techops.*.arn
}

