resource "aws_security_group" "asg-sg" {
  name   = "${var.env}-${var.service}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.env}-${var.service}-sg"
    "Team" = var.team
    "Env"  = var.env
  }
}

resource "aws_launch_configuration" "launch-configuration-asg" {
  name            = "${var.env}-${var.service}-launch-configuration-asg"
  image_id        = var.ami_id
  instance_type   = var.asg_instance_type
  key_name        = var.ssh_key_name
  user_data       = var.user-data-file
  security_groups = [aws_security_group.asg-sg.id]
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "placement_group" {
  name         = "${var.env}-${var.service}-pg"
  strategy     = "spread"
  spread_level = "rack"
}

resource "aws_autoscaling_group" "asg" {
  name                      = "${var.env}-${var.service}-asg"
  max_size                  = var.asg_max_capacity
  min_size                  = var.asg_min_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "ELB"
  desired_capacity          = var.asg_desired_capacity
  force_delete              = true
  placement_group           = aws_placement_group.placement_group.id
  launch_configuration      = aws_launch_configuration.launch-configuration-asg.name
  vpc_zone_identifier       = [var.asg_private_subnet_id_1, var.asg_private_subnet_id_2]

  tag {
    key                 = "Env"
    value               = var.env
    propagate_at_launch = true
  }

  tag {
    key                 = "Team"
    value               = var.team
    propagate_at_launch = true
  }

  tag {
    key                 = "ASG"
    value               = "${var.env}-${var.service}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-${var.service}"
    propagate_at_launch = true
  }
}

resource "aws_security_group_rule" "rds_sg_rule" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  source_security_group_id = aws_security_group.asg-sg.id
  security_group_id = var.rds_sg_rule_id
}