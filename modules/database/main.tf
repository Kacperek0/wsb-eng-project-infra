# AWS Aurora Serverless V2 with PostgreSQL 13.6
resource "aws_rds_cluster" "postgresql" {
  cluster_identifier = var.cluster_identifier
  engine             = "aurora-postgresql"
  engine_version     = "13.6"
  engine_mode        = "provisioned"
  database_name      = var.db_name
  master_username    = "postgres"
  master_password    = var.db_password

  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 2
  }
}

resource "aws_rds_cluster_instance" "instance" {
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "random_password" "master" {
  length           = 32
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "password" {
  name        = "postgresql-password"
  description = "PostgreSQL password"
}

resource "aws_secretsmanager_secret_version" "pwd" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.master.result
}

