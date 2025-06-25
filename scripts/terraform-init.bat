@echo off
terraform init -upgrade
terraform fmt
terraform validate
