terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "networking" {
  source            = "./Networking"
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  public_subnets_az = var.public_subnets_az
  public_subnets_tag = var.public_subnets_tag
}

module "Security-Groups" {
  source = "./Security-Groups"
  vpc_id = module.networking.outputVPCid
}

# module "JenkinsPair" {
#   source = "./key-pair"
#   key_name ="JenkinsPair" 
#   publickeyInstance = file("~/.ssh/JenkinsPair.pem")
# }


module "JenkinsServer" {
  source                        = "./Instance"
  ami                           = var.ami
  instance_type                 = "t2.large"
  key_name                      = "JenkinsPair"
  associate_public_ip_address   = true
  user_data                     = templatefile("/UserData/Jenkins/Jenkins.sh",{})
  subnet_id                     = tolist(module.networking.publicSubnet)[0]
  awsSecuritygroup              = module.Security-Groups.outputSecurityId
  instanceTag                   ="JenkinsServer"
  privatekeypath                ="~/.ssh/JenkinsPair.pem" 
}

# module "WorkerKey-pair" {
#   source = "./key-pair"
#   key_name ="WorkerkeyPair" 
#   publickeyInstance = file("~/.ssh/WorkerK8S.pub")
# }

# module "WorkerNodeServer" {
#   source                        = "./Instance"
#   ami                           = var.ami
#   instance_type                 = "t2.medium"
#   key_name                      = "MasterkeyPair"
#   associate_public_ip_address   = true
#   user_data                     = templatefile("/K8S/K8SWorker.sh",{})
#   subnet_id                     = tolist(module.networking.publicSubnet)[1]
#   awsSecuritygroup              = module.Security-Groups.outputSecurityId
#   instanceTag                   ="WorkerNodeServer"
#   privatekeypath                ="~/.ssh/Workerk8S.pub"
# }



