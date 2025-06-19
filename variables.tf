# Declaring Variables

// Provider

variable "provider_aws_region" {
  default = "us-east-1"
}
variable "provider_aws_credential_file" {
  default = "~/.aws/credentials"
}
variable "provider_role_arn" {
  default = "arn:aws:iam::483375539964:role/splunk-admin-role"
}

//Project

variable "project_application" {
  default = "splunk"
}
variable "project_account_id" {
  default = "483375539964"
}

//Permission Boundary

//KMS

variable "kms_root" {
  default = "arn:aws:iam::483375539964:root"
}
variable "kms_allow_resources" {
  default = [
    "arn:aws:iam::483375539964:user/Adnan",
    "arn:aws:iam::483375539964:role/splunk-admin-role"
  ]
}
variable "kms_number" {
  default = "ec2-01"
}

####################################################################
####################### EC2 Related ######################
####################################################################

//KMS

# variable "kms_root" {
#     default = "arn:aws:iam::483375539964:root"
# }
# variable "kms_allow_resources" {
#     default = [
#         "arn:aws:iam::483375539964:user/Adnan",
#         "arn:aws:iam::483375539964:role/splunk-admin-role",
#         "arn:aws:iam::483375539964:role/aws-service-role/autpscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
#     ]
# }
variable "kms_ec2_number" {
  default = "ec2-01"
}

//IAM EC2 Role

variable "iam_ec2_role_service" {
  default = "ec2"
}
variable "iam_ec2_role_number" {
  default = "01"
}
variable "iam_ec2_role_create_instance_profile" {
  default = true
}

//IAM EC2 Role Policy

variable "iam_ec2_role_policy_service" {
  default = "ec2"
}
variable "iam_ec2_role_policy_number" {
  default = "01"
}
variable "iam_ec2_role_policy_attach_to_role" {
  default = true
}

// IAM KMS Policy

variable "iam_kms_policy_service" {
  default = "kms"
}
variable "iam_kms_policy_number" {
  default = "01"
}
variable "iam_kms_policy_attach_to_role" {
  default = true
}

// IAM Pass Role Policy
variable "iam_pass_role_policy_service" {
  default = "pass-role"
}
variable "iam_pass_role_policy_number" {
  default = "01"
}
variable "iam_pass_role_policy_attach_to_role" {
  default = true
}



####################################################################
####################### AUTO SCALING GROUP ######################
####################################################################

#LAUNCH TEMPLATES VARIABLES

locals {
  block_device_mappings = {
    root_device = {
      device_name = "/ubuntu"
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 8
        volume_type           = "gp2"
      }
    }
  }
}

variable "launch_template_name" {
  default = "splunk-launch-template-01"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "image_id" {
  default = "ami-0574da719dca65348"
}
variable "asg_security_group_ids" {
  default = ["sg-0b8c62f0be5e3e565"]
}
variable "user_data" {
  default = null
}
variable "key_name" {
  default = "splunk-user"
}
variable "enable_monitoring" {
  default = false
}
variable "ebs_optimized" {
  default = false
}
variable "disable_api_termination" {
  default = true
}
variable "kms_key_id" {
  default = "arn:aws:kms:us-east-1:483375539964:key/7949442a-6abe-4806-84e0-400e021efded"
}
variable "http_endpoint" {
  default = "enabled"
}
variable "http_put_resource_hop_limit" {
  default = 1
}


#AUTO SCALING GROUP VARIABLES

variable "autoscaling_group_name" {
  default = "splunk-autoscaling-group-01"
}
variable "max_size" {
  default = 4
}
variable "min_size" {
  default = 4
}
variable "desired_capacity" {
  default = 4
}
variable "health_check_grace_period" {
  default = 300
}
variable "health_check_type" {
  default = "EC2"
}
variable "force_delete" {
  default = true
}
variable "subnet_id" {
  default = ["subnet-0c9e19ed32773fdcf", "subnet-06459b88339d094d5"]
}
variable "load_balancer_target_group_arns" {
  default = []
}
variable "metrics_granularity" {
  default = "1Minute"
}
variable "launch_template_version" {
  default = "$Latest"
}

variable "resource_type" {
  default = "instance"
}
variable "ec2_instance_name" {
  default = "splunkus01"
}
