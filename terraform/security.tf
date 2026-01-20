resource "aws_security_group" "app" {
  name        = "${var.name_prefix}-sg"
  description = "No SSH; allow HTTP optional"
  vpc_id      = aws_vpc.this.id

  # Optional: allow HTTP (we can use this later if we install nginx)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr_for_http]
  }

  # No SSH ingress rule on purpose

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name_prefix}-sg" }
}
