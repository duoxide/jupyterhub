# keypair

resource "aws_key_pair" "mykeypair" {
	key_name = "test"
	public_key = "${file("/home/user/.ssh/id_rsa.pub")}"
}
	
