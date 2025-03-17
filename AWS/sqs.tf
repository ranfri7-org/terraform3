resource "aws_sqs_queue" "my_queue_7" {
  name = "rf-demo-sqs-35"
}

resource "aws_sqs_queue_policy" "my_queue_policy_7" {
  queue_url = aws_sqs_queue.my_queue_7.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sqs:GetQueueUrl",
      "Resource": ""
    }
  ]
}
POLICY
}
