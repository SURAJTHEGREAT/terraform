#the provider can be aws,azure digitalocean
# refer : https://www.terraform.io/docs/providers/aws/r/instance.html 
provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}" 
    secret_key = "${var.AWS_SECRET_KEY}"
    region = "${var.AWS_REGION}" 
}
