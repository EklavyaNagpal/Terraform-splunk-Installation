#Variables

variable "region" {
    type = string
    default = ""
    description = "The region of the VPC"
}

variable "vpc_id" {
    type    = string
    default = "vpc-0252270f86b516c80"
    description = "VPC ID of the existin VPC"
}

variable "subnet_ids" {
    description = "A list of subnets in the VPC"
    type        = list(string)
    default     = []
}

variable "account_no" {
    type        = string
    description = "account no. of the AWS sccount"
}

variable "admin_role" {
    type = string
    description = "account name of AWS account"
}