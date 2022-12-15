resource "aws_security_group" "alb-sg" {
  name   = "${var.env}-${var.service}-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ingress_port_1
    to_port     = var.ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.ingress_port_2
    to_port     = var.ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    "Name" = "${var.env}-${var.service}-alb-sg"
    "Team" = var.team
    "Env"  = var.env
  }
}

resource "aws_lb" "alb" {
  name               = "${var.env}-${var.service}-alb"
  internal           = var.lb_type_internal
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [var.subnet_id_1, var.subnet_id_2]

  tags = {
    Env  = var.env
    Team = var.team
    Name = "${var.env}-${var.service}-alb"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "${var.env}-${var.service}-tg"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_autoscaling_attachment" "prod-web-tg-assignment-1" {
  autoscaling_group_name = var.asg_id
  alb_target_group_arn   = aws_lb_target_group.target_group.arn
}

resource "aws_security_group_rule" "sg_rule_1" {
  type              = "ingress"
  from_port         = var.sg_rule_1_port
  to_port           = var.sg_rule_1_port
  protocol          = "tcp"
  source_security_group_id = aws_security_group.alb-sg.id
  security_group_id = var.sg_rule_id
}

resource "aws_security_group_rule" "sg_rule_2" {
  type              = "ingress"
  from_port         = var.sg_rule_2_port
  to_port           = var.sg_rule_2_port
  protocol          = "tcp"
  source_security_group_id = aws_security_group.alb-sg.id
  security_group_id = var.sg_rule_id
}

