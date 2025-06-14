resource "aws_instance" "ec2_instance" {
    ami                     = var.ec2_ami_id
    instance_type           = var.ec2_instance_type
    availability_zone       = var.ec2_availability_zone
    vpc_security_group_ids  = var.vpc_security_group_ids
    subnet_id               = var.subnet_id
    monitoring              = var.monitoring
    iam_instance_profile    = var.ec2_iam_instance_profile
    key_name                = var.key_name
    disable_api_termination = var.ec2_disable_api_termination
    ebs_optimized           = var.ec2_ebs_optimized
    metadata_options {
        http_endpoint       = var.ec2_http_endpoint
        http_tokens         = "required"
    }
    root_block_device {
        delete_on_termination = true
        encrypted             = true
        kms_key_id            = var.kms_key_id
        volume_size          = var.root_device_volume_size
        volume_type           = var.ec2_volume_type
    }
    dynamic "ebs_block_device" {
        for_each = var.ebs_block_device
        content {
            delete_on_termination   = true
            device_name             = ebs_block_device.value.device_name
            encrypted               = true
            iops                    = lookup(ebs_block_device.value, "iops", null)
            kms_key_id              = var.kms_key_id
            snapshot_id             = lookup(ebs_block_device.value, "snapshot_id", null)
            volume_size             = lookup(ebs_block_device.value, "volume_size", null)
            volume_type             = lookup(ebs_block_device.value, "volume_type", null)
            throughput              = lookup(ebs_block_device.value, "throughput", null)
        }
    }
    # volume_tags = merge{{"Name" = var.ec2_instance_name}, var.tags}
    # tags        = merge{{"Name" = var.ec2_instance_name}, var.tags}

    timeouts {
        create = "2h"
        delete = "2h"
    }
    lifecycle {
        ignore_changes = [instance_type, ebs_block_device] #, volume_tags]
    }
}