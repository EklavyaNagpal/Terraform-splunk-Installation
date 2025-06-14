#IAM Managed Policy And Attach Policy

resource "aws_iam_policy" "iam_policy" {
    name = "${var.project_application}-${var.service}-policy-${var.iam_policy_number}"
    policy = var.iam_policy
    #tags = var.tags
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attach" {
  role       = var.iam_role
  count      = var.iam_attach_to_role == true ? 1 : 0
  policy_arn = aws_iam_policy.iam_policy.id
}