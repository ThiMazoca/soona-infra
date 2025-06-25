provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

module "rds" {
  source        = "../../modules/rds"
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
}

module "ecr" {
  source = "../../modules/ecr"
}

module "s3" {
  source = "../../modules/s3"
}

module "api_gateway" {
  source = "../../modules/api_gateway"
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
}

module "backup" {
  source = "../../modules/backup"
}

module "ecs" {
  source             = "../../modules/ecs"
  execution_role_arn = var.execution_role_arn
  app_image          = var.app_image
  subnets            = var.subnets
  security_group     = var.security_group
}
