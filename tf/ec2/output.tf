output "public_ip" {
  value = aws_eip.app-ip.public_ip
}
