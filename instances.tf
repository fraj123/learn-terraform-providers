data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "amazon_linux_ohio" {
  provider = aws.ohio
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "virginia_web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "Virginia Web"
  }
}

resource "aws_instance" "ohio_web" {
  provider      = aws.ohio
  ami           = data.aws_ami.amazon_linux_ohio.id
  instance_type = "t2.micro"

  tags = {
    Name = "Ohio Web"
  }
  
}
