terraform {

  # here we can mention terraform version
  # terraform.exe version
  required_version = "~> 1.8.1"
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 5.46"
    }
  }
}
