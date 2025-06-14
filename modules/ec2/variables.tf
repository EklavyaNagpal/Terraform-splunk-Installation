#Declaring Variables

variable "ec2_ami_id" {}
variable "ec2_instance_type" {}
variable "ec2_availability_zone" {}
variable "kms_key_id" {}
variable "ec2_monitoring" {}
variable "ec2_disable_api_termination" {}
variable "ec2_iam_instance_profile" {}
variable "ec2_key_name" {}
variable "vpc_secuirty_group_ids" {}
variable "subnet_id" {}


#variable "ebs_device_name" {}
variable "root_device_volume_size" {}
#variable "ebs_device_volume_size" {}
variable "ec2_volume_type" {}
variable "ec2_instance_name" {}
#variable "ec2_user_data" {}
variable "ec2_ebs_optimized" {}

variable "ebs_block_device" {}

variable "ec2_http_endpoint" {}
#variable "ec2_http_toptions" {}



#variable "common_tags" {}
#variable "ec2_tags" {}
# variable "tags" {}

#new variables
#variable "ec2_user_data_template" {}
#variable "s3_bucket_name" {}