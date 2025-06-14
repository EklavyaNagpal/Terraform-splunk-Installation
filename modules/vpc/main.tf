# Main
provider "aws" {
    region = var.region
    assume_role {
        role_arn = "arn:aws:iam::${var.account_no}:role/${var.admin_role}"
    }
}

locals {
    availability_zone_subnets = {
        for s in data.aws_subnet.mcs_subnet : s.availability_zone => s.id...
    }
}

data "aws_vpc" "this" {
    id = var.vpc_id
}

data "aws_subnets" "selected" {
    filter {
        name    = "vpc-id"
        values  = [var.vpc_id]
    }
    filter {
        name    = "subnet-id"
        values  = var.subnet_ids
    }
}

data "aws_subnet" "splunk_subnet" {
    count   = length(data.aws_subnets.selected.ids)
    id      = tolist(data.aws_subnets.selected.ids)[count.index]
}