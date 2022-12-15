resource "aws_security_group" "rds-sg" {
  name   = "${var.env}-rds-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "Bastion access"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-rds-sg"
    Env  = var.env
    Team = var.team
  }
}


resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "main"
  subnet_ids = [var.db_subnet_id_1, var.db_subnet_id_2]

  tags = {
    Name = "${var.env}-db-subnet-group"
    Team = var.team
    Env  = var.env
  }
}

resource "aws_db_instance" "prod-app-db-1" {
  engine                   = var.db_engine
  db_name                  = var.db_name
  username                 = var.db_username
  password                 = var.db_password
  delete_automated_backups = true
  multi_az                 = true
  publicly_accessible      = false
  instance_class           = var.db_instance_class
  skip_final_snapshot      = true
  allocated_storage        = var.db_allocated_storage
  db_subnet_group_name     = aws_db_subnet_group.rds-subnet-group.name
  vpc_security_group_ids   = [aws_security_group.rds-sg.id]
  tags = {
    Name = "${var.env}-app-db"
    Team = var.team
    Env  = var.env
  }
}
