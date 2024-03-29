resource "aws_lambda_function" "producer_lambda" {
  filename      = "${path.module}/js/producer.zip"
  function_name = "zoro-producer"
  role          = aws_iam_role.zuke_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "nodejs16.x"
  timeout = 900
}
resource "aws_lambda_permission" "apigw_lambda_script" {
  statement_id  = "APIGatewayzoroproducer"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.producer_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:ap-south-1:975049977957:${var.aws_api_gateway_rest_api-id-script}/*/POST/product"

}
