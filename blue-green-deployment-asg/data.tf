data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-vpc"]
  }
}

data "aws_internet_gateway" "ig_id" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-ig"]
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
}

data "aws_subnet" "private_subnet_id_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-private-subnet-${substr(var.availability_zone_1, length(var.availability_zone_1) - 1, 1)}"]
  }
}

data "aws_subnet" "private_subnet_id_2" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-private-subnet-${substr(var.availability_zone_2, length(var.availability_zone_2) - 1, 1)}"]
  }
}

data "aws_security_group" "rds_sg_rule_id" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-rds-sg"]
  }
}

data "aws_autoscaling_group" "asg_id_1" {
  name = "${var.env}-${var.service_1}-asg"
  depends_on = [
    module.asg-web-1
  ]
}

data "aws_security_group" "asg-service-sg-1" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-${var.service_1}-sg"]
  }

  depends_on = [
    module.asg-web-1
  ]
}

data "aws_security_group" "asg-service-sg-2" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-${var.service_2}-sg"]
  }

  depends_on = [
    module.asg-app-1
  ]
}

data "aws_autoscaling_group" "asg_id_2" {
  name = "${var.env}-${var.service_2}-asg"
  depends_on = [
    module.asg-app-1
  ]
}

data "aws_autoscaling_group" "asg_id_3" {
  name = "${var.env}-${var.service_3}-asg"
  depends_on = [
    module.asg-web-2
  ]
}

data "aws_security_group" "asg-service-sg-3" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-${var.service_3}-sg"]
  }

  depends_on = [
    module.asg-web-2
  ]
}

data "aws_autoscaling_group" "asg_id_4" {
  name = "${var.env}-${var.service_4}-asg"
  depends_on = [
    module.asg-app-2
  ]
}

data "aws_security_group" "asg-service-sg-4" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-${var.service_4}-sg"]
  }

  depends_on = [
    module.asg-app-2
  ]
}

data "aws_lb" "alb_1" {
  tags = {
    Name = "${var.env}-${var.service_1}-alb"
  }
  depends_on = [
    module.lb-asg-web-1
  ]
}
data "aws_lb" "alb_2" {
  tags = {
    Name = "${var.env}-${var.service_2}-alb"
  }
  depends_on = [
    module.lb-asg-app-1
  ]
}
data "aws_lb" "alb_3" {
  tags = {
    Name = "${var.env}-${var.service_3}-alb"
  }
  depends_on = [
    module.lb-asg-web-2
  ]
}
data "aws_lb" "alb_4" {
  tags = {
    Name = "${var.env}-${var.service_4}-alb"
  }
  depends_on = [
    module.lb-asg-app-2
  ]
}