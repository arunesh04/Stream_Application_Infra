output "products_api_arn" {
  value = aws_lambda_function.producer_lambda.invoke_arn
}
output "order_api_arn" {
  value = aws_lambda_function.order_lambda.invoke_arn
}