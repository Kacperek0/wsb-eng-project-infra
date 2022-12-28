resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.log_group_name
  retention_in_days = 30
}

resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name

    configuration {
        name = "containerInsights"
        value = "enabled"

        log_configuration {
            log_driver = "awslogs"
            options = {
                "awslogs-group" = aws_cloudwatch_log_group.log_group.name
                "awslogs-region" = "eu-west-1'
                "awslogs-stream-prefix" = "ecs"
            }
        }
    }
}
