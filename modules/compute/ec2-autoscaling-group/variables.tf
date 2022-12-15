variable "env" {
  type        = string
  description = "Environment name"
}

variable "team" {
  type        = string
  description = "Team name"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "service" {
  type        = string
  description = "Service name"
}

variable "bastion_sg_id" {
  type        = string
  description = "Bastion Security Group id"
}

variable "ami_id" {
  type        = string
  description = "AMI id"
}

variable "asg_instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
}

variable "user-data-file" {
  type        = string
  description = "User Data - EC2 startup script"
}

variable "root_volume_size" {
  type        = number
  description = "Root Block Device - Volume size"
}

variable "root_volume_type" {
  type        = string
  description = "Root Block Device - Volume type"
}

variable "asg_max_capacity" {
  type = number
}

variable "asg_min_capacity" {
  type = number
}

variable "asg_desired_capacity" {
  type = number
}

variable "health_check_grace_period" {
  type = number
}

variable "asg_private_subnet_id_1" {
  type = string
}

variable "asg_private_subnet_id_2" {
  type = string
}

variable "rds_sg_rule_id" {
  type = string
}