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

module "JenkinsPair" {
  source = "./key-pair"
  key_name ="JenkinsPair"
  fileName="jenkinssh" 
}


module "JenkinsServer" {
  source                        = "./Instance"
  ami                           = var.ami
  instance_type                 = "t2.large"
  key_name                      = "JenkinsPair"
  associate_public_ip_address   = true
  subnet_id                     = tolist(module.networking.publicSubnet)[0]
  awsSecuritygroup              = module.Security-Groups.outputSecurityId
  instanceTag                   ="JenkinsServer"
  userData                      =base64encode(templatefile("/UserData/Jenkins/jenkins.sh",{}))
}

module "JavaKeypair" {
  source = "./key-pair"
  key_name ="JavakeyPair"
  fileName="javassh" 
}

module "JavaServer" {
  source                        = "./Instance"
  ami                           = var.ami
  instance_type                 = "t2.medium"
  key_name                      = "JavakeyPair"
  associate_public_ip_address   = true
  subnet_id                     = tolist(module.networking.publicSubnet)[1]
  awsSecuritygroup              = module.Security-Groups.outputSecurityId
  instanceTag                   ="JavaServer"
  userData                      =base64encode(templatefile("/UserData/Java/java.sh",{}))
}





# module "SonarKeypair" {
#   source = "./key-pair"
#   key_name ="SonarkeyPair"
#   fileName="sonarssh" 
# }

# module "SonarServer" {
#   source                        = "./Instance"
#   ami                           = var.ami
#   instance_type                 = "t2.medium"
#   key_name                      = "SonarkeyPair"
#   associate_public_ip_address   = true
#   subnet_id                     = tolist(module.networking.publicSubnet)[2]
#   awsSecuritygroup              = module.Security-Groups.outputSecurityId
#   instanceTag                   ="SonarServer"
#   userData                      =base64encode(templatefile("/UserData/Sonar/sonar.sh",{}))
# }