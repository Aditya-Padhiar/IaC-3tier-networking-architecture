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

variable "db_port" {
  type        = number
  description = "DB port"
}

variable "bastion_sg_id" {
  type        = string
  description = "Bastion Security Group id"
}

variable "db_subnet_id_1" {
  type        = string
  description = "DB subnet id"
}

variable "db_subnet_id_2" {
  type        = string
  description = "DB subnet id"
}

variable "db_engine" {
  type        = string
  description = "DB Engine"
}

variable "db_name" {
  type        = string
  description = "DB Name"
}

variable "db_username" {
  type        = string
  description = "DB username"
}

variable "db_password" {
  type        = string
  description = "DB Password"
}

variable "db_instance_class" {
  type        = string
  description = "DB Instance Class"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated Storage"
}