# SIEM Cloud Monitoring – Security and Anomaly Detection  

**Author:** Your Name  
**Project Goal:** Deploy a cloud-based **SIEM (Security Information and Event Management)** system using **AWS CloudTrail, CloudWatch, and Terraform** to monitor user activities and detect unusual behavior.  

---

## Overview  

SIEM Cloud Monitoring is a cloud-native solution designed to enhance security in AWS environments. It leverages AWS **CloudTrail** for logging user activities, **CloudWatch** for monitoring and alerting, and **S3** for secure log storage. Terraform is used to provision all resources automatically.  

### Key Features:  
- **User activity tracking** via AWS CloudTrail  
- **Real-time anomaly detection** with CloudWatch Alarms  
- **Secure log storage** using encrypted S3 buckets  
- **Automated deployment** with Terraform  
- **Least privilege IAM policies** for enhanced security  

---

## Technologies Used  

| Technology   | Purpose                          |  
|-------------|----------------------------------|  
| Terraform   | Infrastructure as Code          |  
| AWS S3      | Secure log storage              |  
| AWS CloudTrail | User activity tracking       |  
| AWS CloudWatch | Monitoring & alerting       |  
| IAM         | Access control & security       |  
| GitHub      | Version control                 |  

---

## Project Structure  
```md
siem-cloud-monitoring/ ├── terraform/ │ ├── main.tf # Core Terraform configuration │ ├── cloudtraildef.tf # AWS CloudTrail setup │ ├── cloudwatchalarm.tf # CloudWatch Alarms setup │ ├── logs.tf # CloudWatch Logs configuration │ ├── bucketpolicy.tf # S3 security policies │ ├── .gitignore # Ignore Terraform state files │ └── variables.tf # Input variables for Terraform ├── images/ # Project screenshots ├── README.md # Project documentation
```

## How to Install and Run  

### 1. Clone the Repository  

```sh
git clone https://github.com/paganinicaprice/projects-cloud-computing/siem-iam-cw-ct-policy.git
cd siem-iam-cw-ct-policy

2. Initialize Terraform
terraform init

3. Apply Terraform Configuration
terraform apply -auto-approve

4. Retrieve CloudTrail Logs
After deployment, CloudTrail logs will be stored in the configured S3 bucket.
You can access them from the AWS Management Console or use the AWS CLI:
aws s3 ls s3://your-siem-logs-bucket/

5. Simulate a Security Event
Trigger a test security event by making unauthorized API requests and check if the CloudWatch Alarm is triggered:
aws ec2 describe-instances --profile unauthorized-user

Example Terraform Code
CloudTrail Configuration
resource "aws_cloudtrail" "siem_trail" {
  name                          = "siem-trail"
  s3_bucket_name                = aws_s3_bucket.siem_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true


CloudWatch Alarm for Unauthorized Access
resource "aws_cloudwatch_metric_alarm" "unauthorized_access" {
  alarm_name          = "unauthorized-access"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "UnauthorizedAttempts"
  namespace           = "AWS/CloudTrail"
  period              = 60
  statistic           = "Sum"
  threshold           = 5
  alarm_actions       = [aws_sns_topic.security_alerts.arn]


License
This project is open-source and available under the MIT License.

Summary
AWS SIEM solution for monitoring and anomaly detection
Automated deployment using Terraform
Secure logging with encrypted S3 storage
CloudTrail-based user activity tracking
Real-time alerting with CloudWatch
