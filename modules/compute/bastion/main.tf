resource "aws_key_pair" "admin-key" {
  key_name   = "${var.env}-${var.ssh_key_name}"
  public_key = var.ssh_public_key
  tags = {
    Name = "${var.env}-${var.ssh_key_name}"
    Env  = var.env
    Team = var.team
  }
}

resource "aws_security_group" "bastion-sg" {
  name   = "${var.env}-bastion-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.env}-bastion-sg"
    "Team" = var.team
    "Env"  = var.env
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.aws-linux-2.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  key_name                    = "${var.env}-${var.ssh_key_name}"
  subnet_id                   = var.subnet_id
  hibernation                 = false
  security_groups             = [aws_security_group.bastion-sg.id]
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp2"
    tags = {
      Name = "${var.env}-bastion-volume-${substr(var.availability_zone, length(var.availability_zone) - 1, 1)}"
      Env  = var.env
      Team = var.team
      AZ   = var.availability_zone
    }
  }
  tags = {
    Name = "${var.env}-bastion-${substr(var.availability_zone, length(var.availability_zone) - 1, 1)}"
    Env  = var.env
    Team = var.team
    AZ   = var.availability_zone
  }
}
