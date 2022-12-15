variable "env" {
  type        = string
  description = "Environment name"
  default     = "prod"
}

variable "team" {
  type        = string
  description = "Team name"
  default     = "devops"
}

variable "cidr_block" {
  type        = string
  description = "cidr block"
  default     = "10.0.0.0/16"
}

variable "availability_zone_1" {
  type        = string
  description = "Availability Zone"
  default     = "ap-southeast-1a"
}

variable "public_cidr_block_az1" {
  type        = string
  description = "cidr block"
  default     = "10.0.1.0/24"
}

variable "private_cidr_block_az1" {
  type        = string
  description = "cidr block"
  default     = "10.0.2.0/24"
}

variable "db_cidr_block_az1" {
  type        = string
  description = "cidr block"
  default     = "10.0.3.0/24"
}

variable "availability_zone_2" {
  type        = string
  description = "Availability Zone"
  default     = "ap-southeast-1b"
}

variable "public_cidr_block_az2" {
  type        = string
  description = "cidr block"
  default     = "10.0.4.0/24"
}

variable "private_cidr_block_az2" {
  type        = string
  description = "cidr block"
  default     = "10.0.5.0/24"
}

variable "db_cidr_block_az2" {
  type        = string
  description = "cidr block"
  default     = "10.0.6.0/24"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
  default     = "admin-key"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key name"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1fBau9BGlhg9wV3/7bvOU8kaUHKhSkswkzxRQm4zRFgLmiCDIpuN9puArLCnt21GrKkOI2fqzDyi8UEjdXW0Kb2ij4vu3aKQzxr5uOfjykpgHRjKmy42QVCPw8brP2KEolHQapWrHNgFPtDz5HEThw0l7yuVRekNqvv6KByqlS7/JCHFvGQYxx0W5uPXpXEk80Z6CMrOwTwNtj6Y+/o9lZZ7i7rctSVFIigLj9F0VgSt0PRiL9+4t77c9hEBu7hleGuxhGCLgY7xA6/qyM1Gj7O+0xgJV57wfdVpDgrdYcMH9NrBaQJpbyz0MJRQgWplFxJG8Tmlp/s56ZjIqfzgTAH2lA+XtYu5tWfSBcbwEW7MUIAAX/1LYeC5gSKlLxpSrRxAVkSiqCf5tX4+KpulAEGjmv6GZ1/mi+wL+6Mn/F6d//RMb+90RPmH+yVQUWOq4CXpi9wNKdA+3K27YgBAqfJW0C64xUe8S7I6NbdULwG8vIC4qfIQHFa8Ay0F+aNs= aditya.padhiar1@Adityas-MacBook-Pro-2.local"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}

variable "db_port" {
  type        = number
  description = "DB port"
  default     = 5432
}

variable "db_engine" {
  type        = string
  description = "DB Engine"
  default     = "postgres"
}

variable "db_name" {
  type        = string
  description = "DB Name"
  default     = "postgres"
}

variable "db_username" {
  type        = string
  description = "DB username"
  default     = "appdbadmin"
}

variable "db_password" {
  type        = string
  description = "DB Password"
  default     = "PaSSw0rd"
}

variable "db_instance_class" {
  type        = string
  description = "DB Instance Class"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated Storage"
  default     = 10
}

variable "service_1" {
  type        = string
  description = "Service name"
  default     = "web-1"
}

variable "service_2" {
  type        = string
  description = "Service name"
  default     = "app-1"
}

variable "service_3" {
  type        = string
  description = "Service name"
  default     = "web-2"
}

variable "service_4" {
  type        = string
  description = "Service name"
  default     = "app-2"
}

variable "ami_id" {
  type        = string
  description = "AMI id"
  default     = "ami-0af2f764c580cc1f9"
}

variable "asg_instance_type_1" {
  type    = string
  default = "t2.micro"
}

variable "root_volume_size" {
  type        = number
  description = "Root Block Device - Volume size"
  default     = 8
}

variable "root_volume_type" {
  type        = string
  description = "Root Block Device - Volume type"
  default     = "gp2"
}

variable "asg_max_capacity" {
  type    = number
  default = 4
}

variable "asg_min_capacity" {
  type    = number
  default = 2
}

variable "asg_desired_capacity" {
  type    = number
  default = 2
}

variable "health_check_grace_period" {
  type    = number
  default = 180
}

variable "ingress_port_1" {
  type    = number
  default = 80
}

variable "ingress_port_2" {
  type    = number
  default = 443
}

variable "lb_type_internal" {
  type    = bool
  default = false
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "tg_port" {
  type    = number
  default = 80
}

variable "tg_protocol" {
  type    = string
  default = "HTTP"
}

variable "listener_port" {
  type    = number
  default = 80
}

variable "listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "sg_rule_1_port" {
  type    = number
  default = 80
}

variable "sg_rule_2_port" {
  type    = number
  default = 443
}

variable "hostname_1" {
  type = string
  default = "web.example.com"
}

variable "hostname_2" {
  type = string
  default = "app.example.com"
}

variable "host_zone_id" {
  type = string
  description = "Route 53 hosted zone id."
}