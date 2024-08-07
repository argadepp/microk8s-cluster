resource "aws_instance" "controle-plane" {
  ami = data.aws_ami.ubuntu.id
  key_name = "packer"
  instance_type = var.instanceType
  connection {
    user = "ubuntu"
    type = "ssh"
    private_key = "../../scripts/id_rsa"
    host = self.public_ip
  }
  root_block_device {
    volume_type = gp3
    volume_size = 20
  }
  tags = {
    Name= "${var.product}-${var.environment}-clsuster"
    Environment= "${var.environment}"
    Terraform= true
  }
}