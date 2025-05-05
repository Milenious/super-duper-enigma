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

resource "aws_subnet" "public_subnets" {
  vpc_id = "${aws_vpc.main_vpc.id}"
    count = "${length(var.public_subnets)}"
    cidr_block = "${element(var.public_subnets, count.index)}"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.name_prefix}-public-${count.index}"
    }
}

resource "aws_subnet" "private_subnets" {
  vpc_id = "${aws_vpc.main_vpc.id}"
    count = "${length(var.private_subnets)}"
    cidr_block = "${element(var.private_subnets, count.index)}"
    tags = {
        Name = "${var.name_prefix}-private-${count.index}"
    }
}
