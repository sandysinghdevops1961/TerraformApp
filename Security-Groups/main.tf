#create security group for public instance
variable "vpc_id" {}

output "outputSecurityId" {
  value = aws_security_group.AllNetworkSG.id
}

resource "aws_security_group" "AllNetworkSG" {
  name = "CommonSecurityGroup"
  tags = {
    Name="CommonSecurityGroup"
  }
  vpc_id = var.vpc_id
  ingress = [{ 
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        ipv6_cidr_blocks = [],
        prefix_list_ids = []
        security_groups = []
        self = true
        description = ""
    }
  ]

  egress = [
    { 
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        ipv6_cidr_blocks = [],
        prefix_list_ids = []
        security_groups = []
        self = true
        description = ""
    }
  ]
}
