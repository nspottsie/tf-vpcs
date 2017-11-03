provider "aws" {
  region = "${var.region}"
  profile = "default"
  version = ">1.0"
}
