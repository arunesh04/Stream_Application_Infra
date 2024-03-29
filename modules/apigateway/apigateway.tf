resource "aws_api_gateway_rest_api" "products_api" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "rest_api"
      version = "1.0"
    }
    paths = {
      "/products" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
      "/product" = {
        post = {
          x-amazon-apigateway-integration = {
            type                 = "AWS"
            httpMethod           = "POST"
            payloadFormatVersion = "1.0"
            uri                  = var.producer_api_arn
          }
        }
      }
      "/order" = {
        post = {
          x-amazon-apigateway-integration = {
            type                 = "AWS"
            httpMethod           = "POST"
            payloadFormatVersion = "1.0"
            uri                  = var.order_api_arn
          }
        }
      }
    }
  })

  name = "duke-api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "products_deploy" {
  rest_api_id = aws_api_gateway_rest_api.products_api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.products_api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "example" {
  deployment_id = aws_api_gateway_deployment.products_deploy.id
  rest_api_id   = aws_api_gateway_rest_api.products_api.id
  stage_name    = "dukeprod"
}
