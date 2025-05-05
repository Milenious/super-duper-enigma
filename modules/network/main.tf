provider "aws" {
   region = "us-east-1"

}
provider "aws" {
  alias = "west"
  region = "us-west-2"
}
   
  /*   alias = "${var.region}" == "" ? "secondary" : null
    region = "${var.region}" */


resource "aws_vpc" "main_vpc" {
    cidr_block = "${var.cidr_block}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "${var.name_prefix}"
    }
}

  

