resource "aws_sns_topic" "my_topic" {
  name = "rf-demo-sns-035"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sns:GetTopicAttributes",
      "Resource": "*"
    }
  ]
}
POLICY
}
