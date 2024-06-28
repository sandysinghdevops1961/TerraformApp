variable "vpc_cidr" {
 }

variable "public_subnets" {
}

variable "public_subnets_az" {
}

variable "public_subnets_tag" {
  
}

output "outputVPCid" {
  value = aws_vpc.vpc.id
}

output "publicSubnet" {
  value = aws_subnet.publicsubnets.*.id
}





