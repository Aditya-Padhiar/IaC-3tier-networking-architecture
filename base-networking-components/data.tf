data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-vpc"]
  }
  depends_on = [
    module.vpc
  ]
}

data "aws_internet_gateway" "ig_id" {
  filter {
    name   = "tag:Name"
    values = ["${var.env}-ig"]
  }
  depends_on = [
    module.vpc
  ]
}