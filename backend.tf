terraform {
  backend "s3" {
    bucket = "infrastructure"
    region = "ap-south-1"
    key = "terrform/dev/state.tfstate"
  }
}