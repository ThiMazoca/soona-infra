resource "aws_api_gateway_rest_api" "main" {
  name = "soona-api"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
