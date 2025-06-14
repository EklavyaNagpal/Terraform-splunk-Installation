#Attach Policy To IAM Role

resource "aws_iam_role_policy_attachment" "iam_role_policy_attach" {
  role       = var.iam_role
  count      = length(var.iam_policy_arn)
  policy_arn = var.iam_policy_arn[count.index]
}