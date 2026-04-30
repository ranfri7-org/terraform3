resource "aws_sqs_queue" "my_queue_8" {
  name = "rf-demo-sqs-36"
}

resource "aws_sqs_queue_policy" "my_queue_policy_8" {
  queue_url = aws_sqs_queue.my_queue_8.id
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
