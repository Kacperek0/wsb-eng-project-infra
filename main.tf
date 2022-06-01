module "roles" {
  source = "./modules/roles"
}

module "users" {
  source = "./modules/user"

  for_each = toset(var.users)

  name       = each.key
  policy_arn = module.roles.user_policy_arn
  tags       = var.tags
}

module "buckets" {
  source = "./modules/s3"

  for_each = toset(var.buckets)

  bucket_name = each.key
  tags        = var.tags
}

module "lambda" {
  source = "./modules/lambda"

  lambda_name     = var.lambda_name
  lambda_role_arn = module.roles.lambda_policy_arn
  s3_bucket       = var.buckets[0]
  s3_key_lambda   = "lambda.zip"
  s3_key_layer    = "layer.zip"

  environment = {
    test = "test"
  }

  tags = var.tags
}

module "database" {
  source = "./modules/database"

  cluster_identifier = "wsb-psql-aurora-slsv2"
  db_name            = "wsb_engineering"

  tags = var.tags
}
