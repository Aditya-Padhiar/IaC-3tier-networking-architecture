variable "env" {
  type = string
}

variable "team" {
  type = string
}

variable "service" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_port_1" {
  type = number
}

variable "ingress_port_2" {
  type = number
}

variable "bastion_sg_id" {
  type = string
}

variable "lb_type_internal" {
  type = bool
}

variable "lb_type" {
  type = string
}

variable "subnet_id_1" {
  type = string
}

variable "subnet_id_2" {
  type = string
}

variable "tg_port" {
  type = number
}

variable "tg_protocol" {
  type = string
}

variable "listener_port" {
  type = number
}

variable "listener_protocol" {
  type = string
}

variable "asg_id" {
  type = string
}

variable "sg_rule_id" {
  type = string
}

variable "sg_rule_1_port" {
  type = number
}

variable "sg_rule_2_port" {
  type = number
}