variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
   region       = "us-east-1"
   access_key   = var.AWS_ACCESS_KEY
   secret_key   = var.AWS_SECRET_KEY
}

resource "aws_key_pair" "vdev-key" {
  key_name   = "vdev-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz2pg5FsGvIT8tOTKxsYp2sWYV2M3cu951drOBhW427V0ou7WQk9+L7uwZ+Qm0kPRHYHX+PhLTA+xGFO7Jy4XL7K4fdINzttUN6k/lKfwZ7gZQCb2pWaaoTwTvnzijtU6P4enrwN0nzgaPhOvXv28Tgu5IkC2MKwJtTHO2Utx9/Kzw4vEt4ohlKMAcfGAgXzUX+Xv65jbjgGJ+ji4BOKresFYYiIWvxWwWytgirPmpgzroVHDWQu/VEqhbbMHXrBnvB+Lp9f1au8r87s/072b0LyShMoz+duVzBNOtZrpvo2KG+1MMWDf0Kqj6V6fOLUNcDqP1bkZnzmswmUo7b85L root@alpha02.net"
}

resource "aws_instance" "aws_ec2" {
   ami           = "ami-0323c3dd2da7fb37d"
   instance_type = "t2.micro"
   key_name      = aws_key_pair.vdev-key.key_name
   tags{
        Name="Dev01"
   }
}

