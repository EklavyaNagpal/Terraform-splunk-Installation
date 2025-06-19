//KMS for EC2

module "ec2_kms_aws_key" {
  source              = "../modules/kms"
  project_application = var.project_application
  kms_root            = var.kms_root
  kms_allow_resources = var.kms_allow_resources
  kms_number          = var.kms_number
}

//IAM EC2 Role

module "iam_aws_ec2_role" {
  source                      = "../modules/iam/roles"
  project_application         = var.project_application
  service                     = var.iam_ec2_role_service
  iam_role_number             = var.iam_ec2_role_number
  iam_create_instance_profile = var.iam_ec2_role_create_instance_profile
  #iam_permissions_boundary    = var.iam_permissions_boundary
  iam_assume_role_policy = file("./roles_policies_templates/${var.project_application}-ec2-assume-policy-01.json")
  # tags = var.default_tags
}

# //IAM KMS Policy

# module "iam_aws_kms_policy" {
#     source                      = "../modules/iam/custom_policies"
#     project_application         = var.project_application
#     service                     = var.iam_kms_policy_service
#     iam_policy_number           = var.iam_kms_policy_number
#     iam_policy                  = file("./roles_policies_templates/${var.project_application}-kms-policy-01.json")
#     iam_role                    = module.iam_aws_ec2_role.iam_role_id
#     iam_attach_to_role          = var.iam_kms_policy_attach_to_role
#     #tags                       = vat.default.tags
# }

# # //IAM Pass Role Policy

# module "iam_aws_pass_role_policy" {
#     source                      = "../modules/iam/custom_policies"
#     project_application         = var.project_application
#     service                     = var.iam_pass_role_policy_service
#     iam_policy_number           = var.iam_pass_role_policy_number
#     iam_policy                  = file("./roles_policies_templates/${var.project_application}-pass-role-policy-01.json")
#     iam_role                    = module.iam_aws_ec2_role.iam_role_id
#     iam_attach_to_role          = var.iam_pass_role_policy_attach_to_role
#     #tags                       = vat.default.tags
# }

# # // IAM EC2 Attach Policy

# module "iam_aws_ec2_attach_policy" {
#     source          = "../modules/iam/attach_role_policies"
#     iam_role        = module.iam_aws_ec2_role.iam_role_id
#     iam_policy_arn  = var.iam_ec2_policy_arn
# }



# ###############################################################
# ################# AUTO SCALING GROUP ##############
# ###############################################################

# module "autoscaling_group" {
#   source                            = "../modules/autoscaling_group"
#   launch_template_name              = var.launch_template_name
#   instance_type                     = var.instance_type
#   image_id                          = var.image_id
#   key_name                          = var.key_name
#   # user_data                         = var.user_data
#   vpc_security_group_ids            = var.asg_security_group_ids
#   ebs_optimized                     = var.ebs_optimized
#   disable_api_termination           = var.disable_api_termination
#   iam_instance_profile              = var.iam_instance_profile
#   enable_monitoring                 = var.enable_monitoring
#   block_device_mappings             = local.block_device_mappings
#   kms_key_id                        = var.kms_key_id
#   autoscaling_group_name            = var.autoscaling_group_name
#   max_size                          = var.max_size
#   min_size                          = var.min_size
#   desired_capacity                  = var.desired_capacity
#   health_check_grace_period         = var.health_check_grace_period
#   health_check_type                 = var.health_check_type
#   force_delete                      = var.force_delete
#   subnet_id                         = var.subnet_id
#   load_balancer_target_group_arns   = var.load_balancer_target_group_arns
#   metrics_granularity               = var.metrics_granularity
#   launch_template_version           = var.launch_template_version
#   # tags                              = merge(var.default_tags, var.ec2_tags)
#   resource_type                     = var.resource_type
#   ec2_instance_name                 = var.ec2_instance_name
#   http_endpoint                     = var.http_endpoint
#   http_put_response_hop_limit       = var.http_put_response_hop_limit
#   depends_on                        = [module.iam_aws_ec2_role]
# }