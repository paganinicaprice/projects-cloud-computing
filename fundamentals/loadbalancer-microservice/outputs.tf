output "nginx_lb_static_ip" {
  value = aws_eip.nginx_eip.public_ip
}
