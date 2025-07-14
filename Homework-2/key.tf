resource "aws_key_pair" "deployer" {
  depends_on = [time_sleep.wait_30_seconds]
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "time_sleep" "wait_30_seconds" {
 create_duration = "10s"
}