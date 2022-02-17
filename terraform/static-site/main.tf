terraform {
    required_version = "1.1.5"
}

provider "aws" {
    region = var.region
    profile = var.profile
}

resource "aws_instance" "site" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name="newProjects"
    vpc_security_group_ids = ["sg-67ff7962", "sg-060b6ee863c389e2f"] # Default SG and devops-nginx SG
       tags = {
           Name = var.name
           group = var.group  # Will be the Ansible group
       }
}