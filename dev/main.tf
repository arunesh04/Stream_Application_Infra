provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tf-states-streams"
    key    = "dev.tfstate"
    region = "ap-south-1"
  }
}

module "lambda" {
  source = "../modules/lambda"
  aws_api_gateway_rest_api-id-script = module.apigateway.api-gateway-rest-api-id
}

module "apigateway" {
  source = "../modules/apigateway"
  producer_api_arn = module.lambda.products_api_arn
  order_api_arn = module.lambda.order_api_arn
}
module "ses" {
  source = "../modules/ses"
  email = var.email
}
module "stream" {
  source = "../modules/kinesis"
}
module "dynamodb" {
  source = "../modules/dynamodb"
}


