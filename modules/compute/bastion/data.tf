data "aws_ami" "aws-linux-2" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0af2f764c580cc1f9"]
  }

  owners = ["137112412989"]
}