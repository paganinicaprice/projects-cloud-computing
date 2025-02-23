# filtr metryk dla zdarzenia CreateUser
resource "aws_cloudwatch_log_metric_filter" "create_user_filter" {
  name           = "IAMCreateUserFilter"
  log_group_name = aws_cloudwatch_log_group.iam_trail_logs.name

  pattern = "{ $.eventName = \"CreateUser\" }"       #jakie pola przechwytujemy

  metric_transformation {
    name      = "IAMCreateUserCount"                  #tworzy metryke widoczna w CW
    namespace = "IAMActivity"
    value     = "1"
  }
}

# filtr metryk dla zdarzenia DeleteUser
resource "aws_cloudwatch_log_metric_filter" "delete_user_filter" {
  name           = "IAMDeleteUserFilter"
  log_group_name = aws_cloudwatch_log_group.iam_trail_logs.name

  pattern = "{ ($.eventName = \"DeleteUser\") }"

  metric_transformation {
    name      = "IAMDeleteUserCount"
    namespace = "IAMActivity"
    value     = "1"
  }
}

# Alarm dla zdarzenia CreateUser
resource "aws_cloudwatch_metric_alarm" "iam_create_user_alarm" {
  alarm_name          = "IAMCreateUserAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.create_user_filter.metric_transformation[0].name         #deklaracja ze alarm opiera sie o metryke IAMCreateUSERCount
  namespace           = aws_cloudwatch_log_metric_filter.create_user_filter.metric_transformation[0].namespace
  period              = 120
  statistic           = "Sum"
  threshold           = 1

  alarm_description = "Alarm triggered when user creates a new IAM user."
  alarm_actions     = [aws_sns_topic.cloudwatch_alarm_topic.arn]
  ok_actions        = []

  treat_missing_data = "notBreaching"       #OK state
}

# SNS dla alarmów
resource "aws_sns_topic" "cloudwatch_alarm_topic" {
  name = "IAMAlarmTopic"
}

resource "aws_sns_topic_subscription" "alarm_subscription" {
  topic_arn = aws_sns_topic.cloudwatch_alarm_topic.arn
  protocol  = "email"
  endpoint  = "kamilradlowskimail@gmail.com"
}