resource "aws_vpc" "demo" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.az
}
