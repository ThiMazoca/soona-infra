variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "execution_role_arn" {
  type = string
}

variable "app_image" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_group" {
  type = string
}
