#Terraform Block

terraform {
  required_version = ">= 0.11.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}