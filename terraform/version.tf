terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["C:/Users/ASUS/.aws/config"]
  shared_credentials_files = ["C:/Users/ASUS/.aws/credentials"]
  profile                  = "main"
  alias                    = "main"
  region                   = "ap-southeast-1"
}

provider "aws" {
  shared_config_files      = ["C:/Users/ASUS/.aws/config"]
  shared_credentials_files = ["C:/Users/ASUS/.aws/credentials"]
  profile                  = "prod"
  alias                    = "prod"
  region                   = "ap-southeast-1"
}

provider "aws" {
  shared_config_files      = ["C:/Users/ASUS/.aws/config"]
  shared_credentials_files = ["C:/Users/ASUS/.aws/credentials"]
  profile                  = "dev"
  alias                    = "dev"
  region                   = "ap-southeast-1"
}