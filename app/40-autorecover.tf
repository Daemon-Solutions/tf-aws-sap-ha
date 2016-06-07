resource "aws_cloudwatch_metric_alarm" "autorecover" {
  count               = "${var.create_ha + 1}"
  alarm_name          = "ec2-autorecover-${element(split(",",var.app_names),0)}-${format("%02d",count.index+1)}"
  namespace           = "AWS/EC2"
  evaluation_periods  = "2"
  period              = "60"
  alarm_description   = "This metric auto recovers EC2 instances"
  alarm_actions       = ["arn:aws:automate:${var.aws_region}:ec2:recover"]
  statistic           = "Minimum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "0"
  metric_name         = "StatusCheckFailed_System"
  dimensions {
      InstanceId = "${element(aws_instance.app.*.id,count.index)}"
  }
}
