resource "aws_lambda_function" "shipping_lambda" {
  filename      = "${path.module}/js/shipping-consumer.zip"
  function_name = "zoro-shipping"
  role          = aws_iam_role.zuke_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "nodejs16.x"
  timeout = 900
}