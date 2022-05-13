resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dependency-demo"
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}

resource "random_pet" "this" {
  keepers = {
    b = "value1"
  }
}
