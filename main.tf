provider "aws" {}

variable subnet_cidr_block {
  type        = string
  default     = "10.0.32.0/24"
  description = "subnet cidr block"
}


resource "aws_vpc" "development-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "development-vpc"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "dev-subnet-1"
  }
}

output dev-vpc-id {
  value       = "aws_vpc.development-vpc.id"
  sensitive   = true
  description = "the id of the development vpc created"
  depends_on  = []
}

output dev-subnet-id {
  value       = "aws_subnet.dev-subnet-1.id"
  sensitive   = true
  description = "the id of the subnet created in the development vpc"
  depends_on  = []
}

