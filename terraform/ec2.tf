resource "aws_instance" "app" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app.id]

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name        = "${var.name_prefix}-app"
    Environment = "dev"
    Project     = "ansible-ssm-bootstrap"
  }
}
