
module "bastion" {
  source            = "../modules/compute/bastion"
  env               = var.env
  team              = var.team
  ssh_key_name      = var.ssh_key_name
  ssh_public_key    = var.ssh_public_key
  vpc_id            = data.aws_vpc.vpc.id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone_1
  subnet_id         = data.aws_subnet.public_subnet_a.id
}

module "rds" {
  source               = "../modules/db"
  env                  = var.env
  team                 = var.team
  vpc_id               = data.aws_vpc.vpc.id
  db_port              = var.db_port
  bastion_sg_id        = data.aws_security_group.bastion_sg_id.id
  db_subnet_id_1       = data.aws_subnet.db_subnet_id_1.id
  db_subnet_id_2       = data.aws_subnet.db_subnet_id_2.id
  db_engine            = var.db_engine
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  depends_on = [
    module.bastion
  ]
}