output "ecs_arn" {
  value = aws_ecs_cluster.test.arn
}

output "ecs_task_arn" {
  value = aws_ecs_task_definition.test-def.arn
}