resource "aws_iam_role" "zuke_lambda_role" {
  name = "zuke-role"
  managed_policy_arns = var.zuke_lambda_policy_arns
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

