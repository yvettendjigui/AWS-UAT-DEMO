# variables.tf

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "env_name" {
  type        = string
  description = "Name of the DMS replication instance"
  default     = "dms_test"
}


#locals

locals {
product_namen = finance
project_name = mangement systems

source_username = "CENSUS"
source_server  = "db1.db.com"
source_port = "1521"

destination_username = "ORCl"
destination_server_name = ""
destination_port = "1521"

}

# ssm.parameter


data "aws_ssm_parameter" "subnet_database_a_id" { name = "inf/vpc/subnet_database_a_id" }
data "aws_ssm_parameter" "subnet_database_b_id" { name = "inf/vpc/subnet_database_b_id" }
data "aws_ssm_parameter" "subnet_loadbalancer_a_id" { name = "inf/vpc/subnet_loadbalancer_a_id" }
data "aws_ssm_parameter" "subnet_loadbalancer_b_id" { name = "inf/vpc/subnet_loadbalancer_b_id" }
data "aws_ssm_parameter" "sg_web_server_id" { name = "inf/vpc/sg_web_server_id" }
data "aws_ssm_parameter" "sg_load_balancer_id" { name = "inf/vpc/load_balancer_id" }
data "aws_ssm_parameter" "sg_database_id" { name = "inf/vpc/sg_database_id" }


#Job source
data "aws_ssm_parameter" "source_password" {
depend_on = [aws_ssm_parameter.source_password]
 name = "/${local.project_name}/${var.env_name}/rds/dms/oracle/source_password"
 }
 resource "aws_ssm_parameter" "source_password" {
  name        = "/${local.project_name}/${var.env_name}/rds/dms/oracle/source_password"
  type        = "SecureString"
  value       = "NOT_SET"
  lifecycle { ignore_changes = [ value ] }
  }
  
#Destination
  
data "aws_ssm_parameter" "destination_password" {
depend_on = [aws_ssm_parameter.destination_password]
 name = "/${local.project_name}/${var.env_name}/rds/dms/oracle/destination_password"
 }
 resource "aws_ssm_parameter" "destination_password" {
  name        = "/${local.project_name}/${var.env_name}/rds/dms/oracle/destination_password"
  type        = "SecureString"
  value       = "NOT_SET"
  lifecycle { ignore_changes = [ value ] }
 }  
   
  
}
