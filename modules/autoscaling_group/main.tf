


###################################################################
################## LAUNCH TEMPLATE ################
###################################################################
resource "aws_launch_template" "this" {
    name                        = var.launch_template_name
    instance_type               = var.instance_type
    image_id                    = var.image_id
    key_name                    = var.key_name
    #user_data                   = var.user_data
    vpc_secuirty_group_ids      = var.vpc_secuirty_group_ids
    ebs_optimized               = var.ebs_optimized
    disable_api_termination     = var.disable_api_termination
    iam_instance_profile {
        name = var.iam_instance_profile
    }
    monitoring {
        enabled = var.enable_monitoring
    }
    metadata_options {
        http_endpoint                   = var.http_endpoint
        http_put_response_hop_limit    = var.http_put_response_hop_limit
        http_tokens                     = "required"
        # http_tokens                   = var.http_tokens
    }
    network_interfaces {
        associate_public_ip_address     = false
    }

    dynamic "block_device_mappings" {
        for_each = var.block_device_mappings
        content {
            device_name     = block_device_mappings.value.device_name
            no_device       = try(block_device_mappings.value.no_device, null)
            virtual_name    = try(block_device_mappings.value.virtual_name, null)

            dynamic "ebs" {
                for_each = flatten([try(block_device_mappings.value.ebs, [])])
                content {
                    delete_on_termination   = try(ebs.value.delete_on_termination, null)
                    encrypted               = try(ebs.value.encrypted, null)
                    kms_key_id              = var.kms_key_id
                    iops                    = try(ebs.value.iops, null)
                    throughput              = try(ebs.value.throughput, null)
                    snapshot_id             = try(ebs.value.snapshot_id, null)
                    volume_size             = try(ebs.value.volume_size, null)
                    volume_type             = try(ebs.value.volume_type, null)
                }
            } 
        }
    }
    tag_specification {
        resource_type = var.resource_type

        tags = {
            Name = var.ec2_instance_name
        }
    }

    # tags = var.tags
    lifecycle {
        ignore_changes = [tags, tags_all] #vpc_security_group_ids,
    }
}
####################################################################
#################### AUTO SCALING GROUP ################
####################################################################
resource "aws_autoscaling_group" "this" {
    name                        = var.autoscaling_group_name
    max_size                    = var.max_size
    min_size                    = var.min_size
    desired_capacity            = var.desired_capacity
    health_check_grace_period   = var.health_check_grace_period
    health_check_type           = var.health_check_type
    force_delete                = var.force_delete
    vpc_zone_identifier         = var.subnet_id
    target_group_arns           = var.load_balancer_target_group_arns
    metrics_granularity         = var.metrics_granularity
    launch_template {
        id                      = aws_launch_template.this.id
        version                 = var.launch_template_version
    }
    #tags = var.tags
    lifecycle {
        ignore_changes = [launch_template]
    }
}