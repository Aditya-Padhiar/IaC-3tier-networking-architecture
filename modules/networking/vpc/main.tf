resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.env}-vpc",
    Env  = "${var.env}"
    Team = "${var.team}"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-ig"
    Env  = "${var.env}"
    Team = "${var.team}"
  }
}

