resource "aws_key_pair" "EC2InstanceKeyPair" {
  public_key =tls_private_key.rsa.public_key_openssh
  key_name = var.key_name
    
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "rsakey" {
  content = tls_private_key.rsa.private_key_pem
  filename = var.fileName
}

