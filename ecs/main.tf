resource "aws_ecs_cluster" "test" {
  name = "test-cluster"

  tags = {
    "name" = "test-cluster"
  }
}

# resource "aws_ecs_cluster_capacity_providers" "test-capacity" {
#   cluster_name       = aws_ecs_cluster.test.name
#   capacity_providers = ["FARGATE", "FARGATE_SPOT"]
# }

resource "aws_ecs_task_definition" "test-def" {
  family                   = "dog-fargate"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  task_role_arn            = var.execution_role
  execution_role_arn       = var.execution_role
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "test-def",
    "image": "${var.container_image}",
    "essential": true,
    "portMappings": [
      {
        "name": "test-def-80-tcp",
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp",
        "appProtocol": "http"
      }
    ]
  }
]
TASK_DEFINITION
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

resource "aws_ecs_service" "test-service" {
  name            = "test-service"
  cluster         = aws_ecs_cluster.test.id
  task_definition = aws_ecs_task_definition.test-def.arn
  desired_count = 1
  launch_type = "FARGATE"
  
  load_balancer {
    target_group_arn = var.alb_target_group
    container_name = "test-def"
    container_port = 80
  }
  network_configuration {
    subnets = toset(values(var.subnets))
    assign_public_ip = true
    security_groups = [var.sg]
  }
  deployment_controller {
    type = "CODE_DEPLOY"
  }
}