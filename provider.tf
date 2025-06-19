#Provider Block

provider "aws" {
  region                  = var.provider_aws_region
  shared_credentials_file = var.provider_aws_credential_file
  # profile                 = var.provider_aws_profile
  assume_role {
    role_arn     = var.provider_role_arn
    session_name = "terraform_session"
  }
}