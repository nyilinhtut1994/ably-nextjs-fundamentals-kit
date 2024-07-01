#Security Groups for external_LB
resource "aws_security_group" "external_LB" {
  provider    = aws.main
  name        = "ably_external_LB"
  description = "security group"
  vpc_id      = aws_vpc.vpc_1.id #"YOUR VPC ID"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ably_external_LB"
    Project     = var.project,
    Environment = var.environment
  }
}

#Security Groups for web_tier
resource "aws_security_group" "web_tier" {
  provider    = aws.main
  name        = "ably_web_tier"
  description = "security group"
  vpc_id      = aws_vpc.vpc_1.id #"YOUR VPC ID"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    security_groups = [aws_security_group.external_LB.id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ably_web_tier"
    Project     = var.project,
    Environment = var.environment
  }
}


#Security Groups for mysql
resource "aws_security_group" "mysql" {
  provider    = aws.main
  name        = "ably_mysql"
  description = "security group"
  vpc_id      = aws_vpc.vpc_1.id #"YOUR VPC ID"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_tier.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ably_mysql"
    Project     = var.project,
    Environment = var.environment
  }
}
