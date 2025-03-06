provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "lb_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "microservice" {
  ami           = "ami-045602374a1982480"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id
  security_groups = [aws_security_group.lb_sg.id]
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable python3.8
              sudo yum install -y python3 pip

              mkdir -p /home/ec2-user/microservice
              echo "from flask import Flask
              app = Flask(__name__)

              @app.route('/')
              def home():
                  return 'Hello from Microservice!'

              if __name__ == '__main__':
                  app.run(host='0.0.0.0', port=5000)" > /home/ec2-user/microservice/app.py

              pip3 install flask
              nohup python3 /home/ec2-user/microservice/app.py > /home/ec2-user/microservice/output.log 2>&1 &
              EOF

  tags = {
    Name = "microservice-ec2"
  }
}

resource "aws_instance" "nginx_lb" {
  ami           = "ami-045602374a1982480"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id
  security_groups = [aws_security_group.lb_sg.id]
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx

              MICRO_IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=microservice-ec2" --query "Reservations[*].Instances[*].PrivateIpAddress" --output text)

              echo "upstream backend {
                  server $MICRO_IP:5000;
              }
              server {
                  listen 80;
                  location / {
                      proxy_pass http://backend;
                      proxy_set_header Host \$host;
                      proxy_set_header X-Real-IP \$remote_addr;
                      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
                  }
              }" | sudo tee /etc/nginx/nginx.conf

              sudo systemctl restart nginx
              EOF

  tags = {
    Name = "nginx-load-balancer"
  }
}

resource "aws_eip" "nginx_eip" {
  instance = aws_instance.nginx_lb.id
  domain   = "vpc"
}
