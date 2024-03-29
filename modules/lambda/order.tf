resource "aws_lambda_function" "order_lambda" {
  filename      = "${path.module}/js/order.zip"
  function_name = "zoro-order"
  role          = aws_iam_role.zuke_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "nodejs16.x"
  timeout = 900
}
resource "aws_lambda_permission" "apigw_lambda_script_order" {
  statement_id  = "APIGatewayzoroorder"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.order_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:ap-south-1:975049977957:${var.aws_api_gateway_rest_api-id-script}/*/POST/order"

}
