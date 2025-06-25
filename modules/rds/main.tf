resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.m4.xlarge"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = false
  backup_retention_period = 7
  storage_type         = "gp2"
}
