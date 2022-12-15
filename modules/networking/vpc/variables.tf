variable "env" {
  type = string
  description = "Environment name"
}

variable "team" {
  type = string
  description = "Team name"
}

variable "cidr_block" {
  type = string
  description = "cidr block"
  default = "10.0.0.0/16"
}