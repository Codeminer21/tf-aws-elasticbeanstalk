resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = var.application_name
  description = var.application_description
}

resource "aws_iam_role" "instance_role" {
  name = "my-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "beanstalk_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
  role       = aws_iam_role.instance_role.name
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "my-instance-profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_instance_profile" "example" {
  name = var.instance_profile
  role = aws_iam_role.instance_role.name
}

resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = var.environment_name
  application         = var.application_name
  solution_stack_name = var.solution_stack_name
  cname_prefix        = var.cname_prefix
  description         = var.description

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.instance_profile
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.environment_type
  }
 
}
