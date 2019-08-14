# https://www.terraform.io/docs/providers/aws/r/key_pair.html

resource "aws_key_pair" "deploy_key" {
    
    key_name = "deployer_key"
    public_key = "${file( "${ var.PATH_TO_PUBLIC_KEY }" )}"
}


# lookup in the ami map variable
resource "aws_instance" "terraform2" {

    ami = "${ lookup( var.AMIS,var.AWS_REGION )}"
    instance_type = "t2.micro"
    tags = {
    Name = "terraform-created-instance-variables-1"
    }
    # the below is the key name for this
    key_name = "${ aws_key_pair.deploy_key.key_name }"
    #provision two things , copy the file and then execute
    
    # file provisioner
    provisioner "file" {
        
        source = "script.sh"
        destination = "/tmp/script.sh"

        

    }    


    
    
    # remote-exec provisioner
    
    provisioner "remote-exec" {
        
        inline = [
        
          "chmod +x /tmp/script.sh",
          "sudo /tmp/script.sh"
        ]
        
    }
    
            # how does the provision connect
    connection {
        host = self.public_ip
        user = "${ var.AWS_USER }"
        private_key =  "${file( "${ var.PATH_TO_PRIVATE_KEY }" )}"
    }
    

}


