resource "aws_instance" "os1" {
# argument (argument reference key = value)
	ami = var.amiId
	key_name = "terraform_training_key"
	vpc_security_group_ids = ["sg-0e59830f08db643b0"]
	instance_type = "t2.micro"
	tags  = {
    			Name = "myosbyweb"
 		}






# comment  single line # and multiple line /* */



 connection {
    type     = "ssh"
    user     = "ec2-user"
# give the path
    private_key = file("C:/Users/LENOVO/Downloads/terraform_training_key.pem")
    host     = aws_instance.os1.public_ip
  }
provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo touch /var/www/html/index.html",
      "sudo systemctl enable httpd --now"	
    ]
  } 


}



resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "mywebvol"
  }
}



# add more resources 

resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol.id
  instance_id = aws_instance.os1.id
}


