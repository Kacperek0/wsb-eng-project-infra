resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.log_group_name
  retention_in_days = 30

  tags = var.tags
}

resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  configuration {
    execute_command_configuration {
      log_configuration {
        log_driver           = "awslogs"
        cloudwatch_log_group = aws_cloudwatch_log_group.log_group.name
      }
    }
  }

  tags = var.tags
}
