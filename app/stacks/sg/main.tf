variable "vpc_id" {
}

resource "aws_security_group" "this" {
  name        = "dependency-demo"
  description = "Allow TLS inbound traffic"
  # vpc_id      = aws_vpc.this.id
  vpc_id      = var.vpc_id

  tags = {
    Name = "dependency-demo"
  }
}

resource "random_pet" "this" {
  keepers = {
    a = "value1"
  }
}
