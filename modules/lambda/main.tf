resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
  role          = var.lambda_role_arn

  layers = [aws_lambda_layer_version.layer.arn]

  s3_bucket   = var.s3_bucket
  s3_key      = var.s3_key_lambda
  handler     = "main.handler"
  runtime     = "python3.9"
  memory_size = 128
  timeout     = 30

  environment {
    variables = var.environment
  }

  tags = var.tags
}

resource "aws_lambda_layer_version" "layer" {
  layer_name = "${var.lambda_name}-layer"

  s3_bucket           = var.s3_bucket
  s3_key              = var.s3_key_layer
  compatible_runtimes = ["python3.9"]

}
