variable "vpc_cidr" {}

variable "public_subnets" {}

variable "public_subnets_tag" {
  
}
variable "public_subnets_az" {}

variable "ami" {}

variable "key_name" {
    default = null
}

variable "fileName" {
  default = null
}
 variable "awsSecuritygroup" {
     default = null
}

variable "instanceTag" {
    default = null
}

variable "userData" {
    default = null
}

