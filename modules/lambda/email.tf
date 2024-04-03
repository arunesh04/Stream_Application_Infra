resource "aws_lambda_function" "email_lambda" {
  filename      = "${path.module}/js/email-consumer.zip"
  function_name = "email-consumer"
  role          = aws_iam_role.zuke_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "nodejs16.x"
  timeout = 900
}