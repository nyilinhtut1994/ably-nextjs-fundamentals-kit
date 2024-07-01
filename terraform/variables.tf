#Networking
variable "vpc_cidr_block" {
  default = "192.100.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  default = ["192.100.10.0/24", "192.100.20.0/24", "192.100.30.0/24"]
}

variable "private_subnet_cidr_blocks" {
  default = ["192.100.40.0/24", "192.100.50.0/24", "192.100.60.0/24"]
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "name" {
  default     = "P3-ably"
  type        = string
  description = "Name of the VPC"
}

variable "project" {
  default     = "P3-ably"
  type        = string
  description = "Name of project"
}

variable "environment" {
  default     = "P3-ably"
  type        = string
  description = "Name of Environment"
}


#SGs

/*
variable "project" {
  default     = "P1-ECommerce"
  type        = string
  description = "Name of project"
}

variable "environment" {
  default     = "P1-ECommerce"
  type        = string
  description = "Name of Environment"
}
*/

#EC2
variable "ami_id" {
  type    = string
  default = "ami-0e4b5d31e60aa0acd"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair" {
  type    = string
  default = "DevOps"
}

variable "security_group" {
  type    = string
  default = "sg-089caeddb7fd6eacb"
}

variable "ec2_name" {
  default = ["app instance", "web instance", "stage instance"]
}


#RDS
variable "rds_instance_type" {
  type    = string
  default = "db.t3.micro"
}

/*
variable "security_group" {
  type    = string
  default = "sg-0a00dcc914ac344f3"
}
*/

variable "rds_name" {
  type    = list(any)
  default = ["first instance", "second instance", "third instance"]
}

variable "password" {
  type    = string
  default = "password"
}

variable "db_storage_size" {
  default = 20
}

variable "db_storage_type" {
  default = "gp2"
}

variable "db_engine" {
  default = "mysql"
}