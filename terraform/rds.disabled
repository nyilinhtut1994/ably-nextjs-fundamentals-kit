resource "aws_db_instance" "mysql_main" {
  #availability_zone           = "ap-southeast-1a"
  identifier        = "ably-rds-mysql"
  provider          = aws.main
  allocated_storage = var.db_storage_size
  storage_type      = var.db_storage_type
  db_name           = "ably"
  engine            = "mysql"
  engine_version    = "8.0.36"
  instance_class    = var.rds_instance_type
  password          = var.password
  username          = "nyi"
  #parameter_group_name        = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.mysql.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}

resource "aws_db_subnet_group" "default" {
  provider   = aws.main
  name       = "main"
  subnet_ids = aws_subnet.public_subnet[*].id
  tags = {
    Name = "ably DB subnet group"
  }
}