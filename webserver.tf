provider "aws" {
    region = "eu-central-1"
}

resource "aws_security_group" "web_server" {
name = "web_server"
description = "OPen ports for webserver and ssh"

dynamic "ingress" {

  for_each = [ "80","8080","22" ]

  content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]

}


}

resource "aws_instance" "Ubuntu" {
    ami = "ami-0cc0a36f626a4fdf5" #ubuntu server
    count = 1
    vpc_security_group_ids = [aws_security_group.web_server.id]
    
    instance_type = "t2.micro"
    key_name = "key"
    tags = {
        Name = "Ubuntu"
        Group = "test"

    }
  
}

resource "aws_instance" "RedHat" {
    ami = "ami-010fae13a16763bb4" #centos server
    count = 1
    vpc_security_group_ids = [aws_security_group.web_server.id]
    
    instance_type = "t2.micro"
    key_name = "key"
    tags = {
        Name = "RedHat"
        Group = "test"

    }
  
}