resource "aws_iam_role" "cloudtrail_logging_role" {
  name = "CloudTrailLoggingRole"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "cloudtrail.amazonaws.com"   #stworzenie roli dla Cloudtrail zeby mogl widziec logi z CW
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name = "CloudWatchLogsPolicy"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogStream",                #tworzenie logstreams i przesylanie logow do CW
          "logs:PutLogEvents"
        ],
        "Resource": "${aws_cloudwatch_log_group.iam_trail_logs.arn}:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_logs_policy" {           #polityka przypisywana w celu uprawnien do zapisu logow w CW
  role       = aws_iam_role.cloudtrail_logging_role.name
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_custom_policy" {          #przypisuje do uzytkownika
  role       = aws_iam_role.cloudtrail_logging_role.name
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/CustomCloudTrailPolicy"
}

data "aws_caller_identity" "current" {}    #pobiera dane od aktualnego uzytkownika
