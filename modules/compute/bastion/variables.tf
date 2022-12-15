variable "env" {
  type        = string
  description = "Environment name"
}

variable "team" {
  type        = string
  description = "Team name"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key name"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id"
}