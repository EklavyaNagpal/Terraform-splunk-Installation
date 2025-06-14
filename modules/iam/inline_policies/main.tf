#IAM Inline Policy

resource "aws_iam_role_policy" "iam_role_inline_policy" {
    name = "${var.project_application}-${var.service}-policy-${var.iam_inline_policy_number}"
    role = var.iam_role
    policy = var.iam_policy
    #tags = var.tags
}