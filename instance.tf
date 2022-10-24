# Instance creation

resource "aws_instance" "alex-instance" {
  count = var.enable_blue_env ? var.blue_instance_count : 0
  # ami = "ami-065deacbcaac64cf2"
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main-public-1[0].id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.mykeypair.key_name
  user_data              = file("apache-b.sh")
  tags = {
    Name = "blue-${count.index}"
  }
}

resource "aws_instance" "alex-instance2" {
  count                  = var.enable_green_env ? var.green_instance_count : 0
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main-public-1[0].id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.mykeypair.key_name
  user_data              = file("apache-g.sh")
  tags = {
    Name = "green-${count.index}"
  }
}