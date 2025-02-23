provider "aws" {
  region = "eu-north-1" 
}

resource "aws_iam_policy" "list_users" {
  name        = "ListUsers"
  description = "Policy allowing listing IAM users"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "iam:ListUsers",
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_list_users_policy" {
  user       = "userHR"
  policy_arn = aws_iam_policy.list_users.arn
}

## ALLOW/DENY CREATE USER
resource "aws_iam_policy" "allow_create_user" {
  name        = "AllowCreateUser"
  description = "Polityka pozwalajaca tworzenie uzytkownikow w IAM"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "iam:CreateUser",
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_allow_policy" {
  user       = "userHR"
  policy_arn = aws_iam_policy.allow_create_user.arn
}


#BUCKET S3 - def bucketu 

resource "aws_s3_bucket" "cloudtrail_bucket" {
 bucket = "cloudtrail-logs-${data.aws_caller_identity.current.account_id}"    #nadanie dynamicznej nazwy


  tags = {
    Name        = "CloudTrailLogs"
    Environment = "Production"
  }
}

#CLOUDTRAIL - def grupy logow 

resource "aws_cloudwatch_log_group" "iam_trail_logs" {
  name              = "/aws/cloudtrail/iam"
  retention_in_days = 90
}