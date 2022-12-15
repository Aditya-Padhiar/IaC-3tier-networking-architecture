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

variable "availability_zone_2" {
  type        = string
  description = "Availability Zone"
  default     = "ap-southeast-1b"
}

variable "availability_zone_1" {
  type        = string
  description = "Availability Zone"
  default     = "ap-southeast-1a"
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

variable "db_port" {
  type        = number
  description = "DB port"
  default     = 5432
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
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