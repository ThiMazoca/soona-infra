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
