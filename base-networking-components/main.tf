module "vpc" {
  source     = "../modules/networking/vpc"
  cidr_block = var.cidr_block
  team       = var.team
  env        = var.env
}

module "subnets-az1" {
  source             = "../modules/networking/subnets"
  team               = var.team
  env                = var.env
  availability_zone  = var.availability_zone_1
  public_cidr_block  = var.public_cidr_block_az1
  private_cidr_block = var.private_cidr_block_az1
  db_cidr_block      = var.db_cidr_block_az1
  vpc_id             = data.aws_vpc.vpc.id
  ig_id              = data.aws_internet_gateway.ig_id.id
  depends_on = [
    module.vpc
  ]
}

module "subnets-az2" {
  source             = "../modules/networking/subnets"
  team               = var.team
  env                = var.env
  availability_zone  = var.availability_zone_2
  public_cidr_block  = var.public_cidr_block_az2
  private_cidr_block = var.private_cidr_block_az2
  db_cidr_block      = var.db_cidr_block_az2
  vpc_id             = data.aws_vpc.vpc.id
  ig_id              = data.aws_internet_gateway.ig_id.id
  depends_on = [
    module.vpc
  ]
}