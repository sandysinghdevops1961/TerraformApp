resource "aws_key_pair" "EC2InstanceKeyPair" {
  public_key = var.publickeyInstance
  key_name = var.key_name
}