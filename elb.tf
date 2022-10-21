module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "3.0.1"
  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    #{
    # instance_port     = 8080
    #  instance_protocol = "http"
    #  lb_port           = 8080
    #  lb_protocol       = "http"
      #ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    #},
  ]
  name = "alex-elb"
  # name_prefix string
  security_groups = [aws_security_group.allow-ssh.id]
  subnets = [aws_subnet.main-public-1.id]
  # instances = [aws_instance.alex-instance[0].id, aws_instance.alex-instance[1].id]
  instances = [aws_instance.alex-instance.id]
  depends_on = [aws_instance.alex-instance]
  number_of_instances = 1
}