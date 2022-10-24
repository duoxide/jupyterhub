# Launch config creation
resource "aws_launch_configuration" "alex_lc" {
  image_id      = data.aws_ami.ubuntu_latest.id
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  key_name = aws_key_pair.mykeypair.key_name
  user_data = "${file("apache.sh")}"
  depends_on = [aws_instance.alex-instance]
  lifecycle {
      create_before_destroy = true
  }
}

#Create Autoscaling group
resource "aws_autoscaling_group" "alex_asg" {
  vpc_zone_identifier = ["${aws_subnet.main-public-1.id}"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  load_balancers = [module.elb.elb_id] 
  launch_configuration = aws_launch_configuration.alex_lc.id
  depends_on = [aws_launch_configuration.alex_lc]
  lifecycle {
      create_before_destroy = true
  }  
}