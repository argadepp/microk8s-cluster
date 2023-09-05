module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "spot-instance"

  create_spot_instance = false
  spot_price           = "0.60"
  spot_type            = "persistent"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instType
  key_name             = "gaction1"

  root_block_device = [
    {
      volume_size = "20"
      volume_type = "gp2"
    }
  ]

  user_data = file("https://raw.githubusercontent.com/argadepp/DevOps-Infra/master/scripts/microk8s.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "${var.product}-${var.env}-master-ec2"
  }
}


