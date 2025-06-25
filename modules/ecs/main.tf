resource "aws_ecs_cluster" "main" {
  name = "soona-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "app-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn
  container_definitions    = jsonencode([{
    name      = "app"
    image     = var.app_image
    essential = true
    portMappings = [{ containerPort = 8000 }],
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/app"
        awslogs-region        = "us-east-2"
        awslogs-stream-prefix = "ecs"
      }
    }
  }])
}

resource "aws_ecs_service" "app" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 3
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.subnets
    security_groups = [var.security_group]
    assign_public_ip = true
  }
}
