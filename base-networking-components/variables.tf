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
