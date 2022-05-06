resource "aws_security_group" "LoadBalancerSecurityGroup" {
  vpc_id      = var.VpcId
  name        = "${terraform.workspace}-${var.EnvName}-LoadBalancerSecurityGroup"
  description = "security group that allows all ingress and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-${var.EnvName}-LoadBalancerSecurityGroup"
  }
}

resource "aws_security_group" "InstanceSecurityGroup" {
  vpc_id      = var.VpcId
  name        = "${terraform.workspace}-${var.EnvName}-InstanceSecurityGroup"
  description = "security group that allows all ingress and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.LoadBalancerSecurityGroup.id]
  }
  tags = {
    Name = "${terraform.workspace}-${var.EnvName}-InstanceSecurityGroup"
  }
}