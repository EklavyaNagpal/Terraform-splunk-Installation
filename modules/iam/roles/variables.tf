#Declaring Variables

variable "project_application" {}
#variable "project_environment" {}
variable "service" {}
variable "iam_role_number" {}
#variable "iam_permissions_boundary" {}
variable "iam_assume_role_policy" {}
variable "iam_policy_number" {
    default = "null"
}
variable "iam_role_policy" {
    default = "null"
}
variable "iam_create_instance_profile" {
    default = false
}
variable "iam_attach_inline_policy" {
    default = false
}

#variable "tags" {}