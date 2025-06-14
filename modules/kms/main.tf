#Create KMS key and KMS Alias

resource "aws_kms_key" "kms_key" {
    description = "KMS for Encrypting ${upper(var.project_application)} Application"
    enable_key_rotation = true
    policy = jsonencode({
        "Version" : "2012-10-17",
        "Statement": [
            {
                "Sid": "Enable full permission for Root",
                "Effect": "Allow",
                "Principal": {
                    "AWS": var.kms_root
                },
                "Action": "kms:*",
                "Resource": "*"
            },
            {
                "Sid": "Allow Access for Key Administrators",
                "Effect": "Allow",
                "Principal": {
                    "AWS": var.kms_root
                },
                "Action": [
                    "kms:Create*",
                    "kms:Describe*",
                    "kms:Enable*",
                    "kms:List*",
                    "kms:Put*",
                    "kms:Update*",
                    "kms:Revoke*",
                    "kms:Disable*",
                    "kms:Get*",
                    "kms:Delete*",
                    "kms:TagResource",
                    "kms:UntagResource",
                    "kms:ScheduleKeyDeletion",
                    "kms:CancelKeyDeletion"
                ],
                "Resource": "*"
            },
            {
                "Sid": "Allow use of the Key",
                "Effect": "Allow",
                "Principal": {
                    "AWS": var.kms_allow_resources
                },
                "Action": [
                    "kms:Encrypt",
                    "kms:Decrypt",
                    "kms:ReEncrypt",
                    "kms:GenerateDataKey*",
                    "kms:DescribeKey"
                ],
                "Resource": "*"
            },
            {
                "Sid": "Allow Attachment of Persistent Resources",
                "Effect": "Allow",
                "Principal": {
                    "AWS": var.kms_allow_resources
                },
                "Action": [
                    "kms:CreateGrant",
                    "kms:ListGrants",
                    "kms:RevokeGrant"
                ],
                "Resource": "*",
                "Condition": {
                    "Bool": {
                        "kms:GrantIsForAWSResource": "true"
                    }
                }
            }
        ]
    })
    tags = {
        Name = "${lower(var.project_application)}-kms-${var.kms_number}"
    }
}

# resource "aws_kms_alias" "kms_alias" {
#     Name = "alias/${lower(var.project_application)}-kms-${var.kms_number}"
# }
