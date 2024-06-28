resource "aws_instance" "Ec2Instance" {
  ami = var.ami
  disable_api_termination = false
  key_name = var.key_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [var.awsSecuritygroup]
  user_data = var.userData
  tags = {
    Name=var.instanceTag
  }

  
}


