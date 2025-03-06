resource "aws_cloudtrail" "main" {
  name                          = "MainTrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.bucket     #zapisuje logi do tego bucketu
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = false

  event_selector {
    read_write_type           = "All"
    include_management_events = true

  }

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.iam_trail_logs.arn}:*"         #integracja z CW
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_logging_role.arn
}