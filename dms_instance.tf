resource "aws_dms_replication_instance" "dms_migration_instance" {
  replication_instance_id = "${local.project_name}-${local.product_name}-${var.env_name}-dms"
  replication_instance_class = var.replication_instance_class
  allocated_storage           = 4096
  engine_version              = "3.6.1
  publicly_accessible         = true
  replication_subnet_group_id   = aws_dms_replication_subnet_group.default.id
  vpc_security_group_ids        = [ data.aws_ss_parameter.sg_database_id.value ]
  
  }
  
resource "aws_dms_replication_subnet_group" "default" {
  replication_subnet_group_id          = "dms-replication_subnet_group"
  replication_subnet_group_description = "replication subnet group"
  
   subnet_ids = [
     data.aws_ss_parameter.subnet_database_a_id.value,
	 data.aws_ss_parameter.subnet_database_b_id.value
	
	]
}	
	 
