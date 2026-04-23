provider "aws" {
    region = "us-east-1"
}

module "ec2_instance" {
    source = "git::https://github.com/reddygangalakunta/Terraform_files.git//modularity/modules/ec2_instance?ref=main"
    ami_value = "ami-0ec10929233384c7f"
    instance_type_value = "t3.micro"
}

output "instance_public_ip" {
    value = module.ec2_instance.public_ip_address
}