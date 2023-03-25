resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = var.max_message_size
  })

  tags = {
    Environment = var.Environment
  }
}
resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name = var.name-queue
  redrive_allow_policy = jsonencode({
    redrivePermission = var.redrivePermission
    sourceQueueArns   = [aws_sqs_queue.terraform_queue.arn]
  })
}