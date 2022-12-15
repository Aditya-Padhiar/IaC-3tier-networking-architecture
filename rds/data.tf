data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-vpc"]
  }
}

data "aws_subnet" "public_subnet_a" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-public-subnet-${substr(var.availability_zone_1, length(var.availability_zone_1) - 1, 1)}"]
  }
}

data "aws_subnet" "public_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-public-subnet-${substr(var.availability_zone_2, length(var.availability_zone_2) - 1, 1)}"]
  }
}

data "aws_subnet" "db_subnet_id_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-private-db-subnet-${substr(var.availability_zone_1, length(var.availability_zone_1) - 1, 1)}"]
  }
}

data "aws_subnet" "db_subnet_id_2" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-private-db-subnet-${substr(var.availability_zone_2, length(var.availability_zone_2) - 1, 1)}"]
  }
}

data "aws_security_group" "bastion_sg_id" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-bastion-sg"]
  }
  depends_on = [
    module.bastion
  ]
}
