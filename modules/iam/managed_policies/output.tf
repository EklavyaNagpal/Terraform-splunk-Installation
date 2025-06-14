#Output

output "policy_arn" {
    value = aws_iam_role_policy_attachment.aws_iam_role_policy_attachment.arn
}
