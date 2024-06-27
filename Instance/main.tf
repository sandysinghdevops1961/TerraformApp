resource "aws_instance" "JenkinsServer" {
  ami = var.ami
  disable_api_termination = false
  key_name = var.key_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  user_data = var.user_data
  vpc_security_group_ids = [var.awsSecuritygroup]
  tags = {
    Name=var.instanceTag
  }

  
}


