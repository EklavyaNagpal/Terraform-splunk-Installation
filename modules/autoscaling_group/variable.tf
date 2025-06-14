#LAUNCH TEMPLATE VARIABLES

variable "launch_template_name" {}
variable "image_id" {}
variable "instance_type" {}
variable "vpc_security_group_ids" {}
#variable "user_data" {}
variable "block_device_mappings" {}
variable "iam_instance_profile" {}
variable "key_name" {}
variable "enable_monitoring" {}
variable "ebs_optimized" {}
variable "disable_api_termination" {}
variable "kms_key_id" {}
variable "http_endpoint" {}
variable "http_put_response_hop_limit" {}
#variable "http_tokens" {
    #type = string
#   }


#AUTO_SCALING GROUP VARIABLES

variable "autoscaling_group_name" {}
variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
variable "health_check_grace_period" {}
variable "health_check_type" {}
variable "force_delete" {}
variable "subnet_id" {}
variable "load_balancer_target_group_arns" {}
variable "metrics_granularity" {}
variable "launch_template_version" {}
variable "ec2_instance_name" {}

# variable "tags" {}
variable "resource_type" {}