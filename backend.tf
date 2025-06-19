# TERRAFORM-S3-BACKEND #

terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "splunk-terraform-s3-01/state_file/"
    key            = "splunk-terraform-01.tfstate"
    dynamodb_table = "splunk-terraform-lock-01"
    encrypt        = "true"
    kms_key_id     = "arn:aws:kms:us-east-1:483375539964:key/17ca260d-e550-4744-9afb-3a2badd5ca72"
  }
}

#######################