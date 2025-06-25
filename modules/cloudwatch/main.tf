resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/app"
  retention_in_days = 14
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "soona-dashboard"
  dashboard_body = jsonencode({
    widgets = [{
      type = "metric",
      properties = {
        metrics = [["AWS/EC2", "CPUUtilization"]],
        period  = 300,
        stat    = "Average",
        region  = "us-east-2"
      }
    }]
  })
}
