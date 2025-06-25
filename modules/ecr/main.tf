resource "aws_ecr_repository" "app" {
  name = "app-container"
}
resource "aws_ecr_repository" "api" {
  name = "api-container"
}
resource "aws_ecr_repository" "web" {
  name = "web-server"
}
