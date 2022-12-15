module "asg-web-1" {
  source                    = "../modules/compute/ec2-autoscaling-group"
  env                       = var.env
  team                      = var.team
  vpc_id                    = data.aws_vpc.vpc.id
  service                   = var.service_1
  bastion_sg_id             = data.aws_security_group.bastion_sg_id.id
  ami_id                    = var.ami_id
  asg_instance_type         = var.asg_instance_type_1
  ssh_key_name              = "${var.env}-${var.ssh_key_name}"
  user-data-file            = file("${path.module}/user-data-${var.service_1}.sh")
  root_volume_size          = var.root_volume_size
  root_volume_type          = var.root_volume_type
  asg_max_capacity          = var.asg_max_capacity
  asg_min_capacity          = var.asg_min_capacity
  asg_desired_capacity      = var.asg_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  asg_private_subnet_id_1   = data.aws_subnet.private_subnet_id_1.id
  asg_private_subnet_id_2   = data.aws_subnet.private_subnet_id_2.id
  rds_sg_rule_id            = data.aws_security_group.rds_sg_rule_id.id
}

module "lb-asg-web-1" {
  source            = "../modules/networking/alb"
  env               = var.env
  team              = var.team
  service           = var.service_1
  vpc_id            = data.aws_vpc.vpc.id
  ingress_port_1    = var.ingress_port_1
  ingress_port_2    = var.ingress_port_2
  bastion_sg_id     = data.aws_security_group.bastion_sg_id.id
  lb_type_internal  = var.lb_type_internal
  lb_type           = var.lb_type
  subnet_id_1       = data.aws_subnet.public_subnet_a.id
  subnet_id_2       = data.aws_subnet.public_subnet_b.id
  tg_port           = var.tg_port
  tg_protocol       = var.tg_protocol
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
  asg_id            = data.aws_autoscaling_group.asg_id_1.id
  sg_rule_id        = data.aws_security_group.asg-service-sg-1.id
  sg_rule_1_port    = var.sg_rule_1_port
  sg_rule_2_port    = var.sg_rule_2_port
  depends_on = [
    module.asg-web-1
  ]
}

module "asg-app-1" {
  source                    = "../modules/compute/ec2-autoscaling-group"
  env                       = var.env
  team                      = var.team
  vpc_id                    = data.aws_vpc.vpc.id
  service                   = var.service_2
  bastion_sg_id             = data.aws_security_group.bastion_sg_id.id
  ami_id                    = var.ami_id
  asg_instance_type         = var.asg_instance_type_1
  ssh_key_name              = "${var.env}-${var.ssh_key_name}"
  user-data-file            = file("${path.module}/user-data-${var.service_2}.sh")
  root_volume_size          = var.root_volume_size
  root_volume_type          = var.root_volume_type
  asg_max_capacity          = var.asg_max_capacity
  asg_min_capacity          = var.asg_min_capacity
  asg_desired_capacity      = var.asg_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  asg_private_subnet_id_1   = data.aws_subnet.private_subnet_id_1.id
  asg_private_subnet_id_2   = data.aws_subnet.private_subnet_id_2.id
  rds_sg_rule_id            = data.aws_security_group.rds_sg_rule_id.id
}

module "lb-asg-app-1" {
  source            = "../modules/networking/alb"
  env               = var.env
  team              = var.team
  service           = var.service_2
  vpc_id            = data.aws_vpc.vpc.id
  ingress_port_1    = 80
  ingress_port_2    = 443
  bastion_sg_id     = data.aws_security_group.bastion_sg_id.id
  lb_type_internal  = true
  lb_type           = var.lb_type
  subnet_id_1       = data.aws_subnet.private_subnet_id_1.id
  subnet_id_2       = data.aws_subnet.private_subnet_id_2.id
  tg_port           = 8080
  tg_protocol       = var.tg_protocol
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
  asg_id            = data.aws_autoscaling_group.asg_id_2.id
  sg_rule_id        = data.aws_security_group.asg-service-sg-2.id
  sg_rule_1_port    = 8080
  sg_rule_2_port    = 443
  depends_on = [
    module.asg-app-1
  ]
}

module "asg-web-2" {
  source                    = "../modules/compute/ec2-autoscaling-group"
  env                       = var.env
  team                      = var.team
  vpc_id                    = data.aws_vpc.vpc.id
  service                   = var.service_3
  bastion_sg_id             = data.aws_security_group.bastion_sg_id.id
  ami_id                    = var.ami_id
  asg_instance_type         = var.asg_instance_type_1
  ssh_key_name              = "${var.env}-${var.ssh_key_name}"
  user-data-file            = file("${path.module}/user-data-${var.service_3}.sh")
  root_volume_size          = var.root_volume_size
  root_volume_type          = var.root_volume_type
  asg_max_capacity          = var.asg_max_capacity
  asg_min_capacity          = var.asg_min_capacity
  asg_desired_capacity      = var.asg_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  asg_private_subnet_id_1   = data.aws_subnet.private_subnet_id_1.id
  asg_private_subnet_id_2   = data.aws_subnet.private_subnet_id_2.id
  rds_sg_rule_id            = data.aws_security_group.rds_sg_rule_id.id
}

module "lb-asg-web-2" {
  source            = "../modules/networking/alb"
  env               = var.env
  team              = var.team
  service           = var.service_3
  vpc_id            = data.aws_vpc.vpc.id
  ingress_port_1    = var.ingress_port_1
  ingress_port_2    = var.ingress_port_2
  bastion_sg_id     = data.aws_security_group.bastion_sg_id.id
  lb_type_internal  = var.lb_type_internal
  lb_type           = var.lb_type
  subnet_id_1       = data.aws_subnet.public_subnet_a.id
  subnet_id_2       = data.aws_subnet.public_subnet_b.id
  tg_port           = var.tg_port
  tg_protocol       = var.tg_protocol
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
  asg_id            = data.aws_autoscaling_group.asg_id_3.id
  sg_rule_id        = data.aws_security_group.asg-service-sg-3.id
  sg_rule_1_port    = var.sg_rule_1_port
  sg_rule_2_port    = var.sg_rule_2_port
  depends_on = [
    module.asg-web-2
  ]
}

module "asg-app-2" {
  source                    = "../modules/compute/ec2-autoscaling-group"
  env                       = var.env
  team                      = var.team
  vpc_id                    = data.aws_vpc.vpc.id
  service                   = var.service_4
  bastion_sg_id             = data.aws_security_group.bastion_sg_id.id
  ami_id                    = var.ami_id
  asg_instance_type         = var.asg_instance_type_1
  ssh_key_name              = "${var.env}-${var.ssh_key_name}"
  user-data-file            = file("${path.module}/user-data-${var.service_4}.sh")
  root_volume_size          = var.root_volume_size
  root_volume_type          = var.root_volume_type
  asg_max_capacity          = var.asg_max_capacity
  asg_min_capacity          = var.asg_min_capacity
  asg_desired_capacity      = var.asg_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  asg_private_subnet_id_1   = data.aws_subnet.private_subnet_id_1.id
  asg_private_subnet_id_2   = data.aws_subnet.private_subnet_id_2.id
  rds_sg_rule_id            = data.aws_security_group.rds_sg_rule_id.id
}

module "lb-asg-app-2" {
  source            = "../modules/networking/alb"
  env               = var.env
  team              = var.team
  service           = var.service_4
  vpc_id            = data.aws_vpc.vpc.id
  ingress_port_1    = 80
  ingress_port_2    = 443
  bastion_sg_id     = data.aws_security_group.bastion_sg_id.id
  lb_type_internal  = true
  lb_type           = var.lb_type
  subnet_id_1       = data.aws_subnet.private_subnet_id_1.id
  subnet_id_2       = data.aws_subnet.private_subnet_id_2.id
  tg_port           = 8080
  tg_protocol       = var.tg_protocol
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
  asg_id            = data.aws_autoscaling_group.asg_id_4.id
  sg_rule_id        = data.aws_security_group.asg-service-sg-4.id
  sg_rule_1_port    = 8080
  sg_rule_2_port    = 443
  depends_on = [
    module.asg-app-2
  ]
}

# Use this only if you have already setup hosted zone in route53 

# module "r53-web" {
#   source = "../modules/networking/r53"
#   team = var.team
#   env = var.env
#   service_1 = var.service_1
#   service_2 = var.service_3
#   hostname = var.hostname_1
#   record_1 = data.aws_lb.alb_1.dns_name
#   record_2 = data.aws_lb.alb_3.dns_name
#   host_zone_id = var.host_zone_id
#   depends_on = [
#     module.asg-web-1,
#     module.lb-asg-web-1,
#     module.asg-web-2,
#     module.lb-asg-web-2
#   ]
# }
# 
# module "r53-app" {
#   source = "../modules/networking/r53"
#   team = var.team
#   env = var.env
#   service_1 = var.service_2
#   service_2 = var.service_4
#   hostname = var.host
#   record_1 = data.aws_lb.alb_2.dns_name
#   record_2 = data.aws_lb.alb_4.dns_name
#   host_zone_id = var.host_zone_id
#   depends_on = [
#     module.asg-app-1,
#     module.lb-asg-app-1,
#     module.asg-app-2,
#     module.lb-asg-app-2
#   ]
# }