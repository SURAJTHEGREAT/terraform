variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "ap-south-1"
}
variable "AMIS" {
    type = "map"
    default = {
      ap-east-1	=	"ami-858cf7f4"
      ap-northeast-1	=	"ami-0be1096bf1584e21e"
      ap-south-1	=	"ami-0b3cc29bd6f2f676d"
      ap-southeast-1	=	"ami-0ce557cba5eb3e90f"
    }
}
variable "PATH_TO_PUBLIC_KEY" {
    default = "deployer_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "deployer_key"
}

variable "AWS_USER" {}
