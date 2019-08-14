# lookup in the ami map variable
resource "aws_instance" "terraform2" {

    ami = "${ lookup( var.AMIS,var.AWS_REGION )}"
    instance_type = "t2.micro"
    tags = {
    Name = "terraform-created-instance-variables"
    }
    
provisioner "local-exec" {
    command = "echo ${aws_instance.terraform2.tags.Name} >> private_ip.txt"
    }    
    
}


