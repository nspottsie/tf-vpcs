terraform {
  backend "s3" {
    bucket = "tfstate.awsguy.solutions"
    key    = "vpcs"
    region = "us-east-1"
  }
}
