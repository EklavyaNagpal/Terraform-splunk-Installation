#Create IAM Role, Instance Profile and Attach Inline Policy

resource "aws_iam_role" "iam_role" {
  name =  "${var.project_application}-${var.service}-role-${var.iam_role_number}"
  path = "/"
  #assume_role_policy = var.iam_assume_role_policy
  assume_role_policy = var.iam_assume_role_policy
}

resource "aws_iam_instance_profile" "aws_iam_instance_profile" {
  role       = aws_iam_role.iam_role.name
  count      = var.iam_create_instance_profile == true ? 1 : 0
  name = "${var.project_application}-${var.service}-role-${var.iam_role_number}"
  #tags = var.tags
}

resource "aws_iam_role_policy" "iam_role_policy" {
    count       = var.iam_attach_inline_policy == true ? 1 : 0
    name        = "${var.project_application}-${var.service}-policy-${var.iam_policy_number}"
    role        = aws_iam_role.iam_role.id
    policy      = var.iam_role_policy
    #tags = var.tags
}