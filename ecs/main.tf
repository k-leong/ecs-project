resource "aws_ecs_cluster" "test" {
  name = "test-cluster"
}

resource "aws_ecs_task_definition" "test_task" {
  family                   = "task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "test-task",
    "image": "${var.aws_ecr_repository.repository_url}:latest",
    "cpu": 1024,
    "memory": 2048,
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}
