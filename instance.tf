# Instance creation

resource "aws_instance" "alex-instance" {
	ami = "ami-065deacbcaac64cf2"
	instance_type = "t2.micro"
	subnet_id = aws_subnet.main-public-1.id
	vpc_security_group_ids = [aws_security_group.allow-ssh.id]
	key_name = aws_key_pair.mykeypair.key_name
}
