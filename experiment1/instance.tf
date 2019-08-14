#the provider can be aws,azure digitalocean
# refer : https://www.terraform.io/docs/providers/aws/r/instance.html 
provider "aws" {
    access_key = "AKIAZHFGJ5BT3IPZ4YSP"
    secret_key = "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"
    region = "ap-south-1"
}

# https://www.terraform.io/docs/providers/aws/index.html 
resource "aws_instance" "terraform1" {
    ami = "ami-54d2a63b"
    instance_type = "t2.micro"
    tags = {
    Name = "terraform-created-instance"
    }	
    
}
	
