resource "aws_subnet" "public" {
  count = "${length(data.aws_availability_zones.available.names)}"
  assign_ipv6_address_on_creation = false
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block = "${cidrsubnet(aws_vpc.default.cidr_block, 8, count.index)}"
  map_public_ip_on_launch = true
  vpc_id     = "${aws_vpc.default.id}"
  tags {
    Name = "public"
  }
}

output "subnets.public.ids" {
  value = "${aws_subnet.public.*.id}"
}

resource "aws_subnet" "private" {
  count = "${length(data.aws_availability_zones.available.names)}"
  assign_ipv6_address_on_creation = false
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block = "${cidrsubnet(aws_vpc.default.cidr_block, 8, 6 + count.index)}"
  map_public_ip_on_launch = false
  vpc_id     = "${aws_vpc.default.id}"
  tags {
    Name = "private"
  }
}

output "subnets.private.ids" {
  value = "${aws_subnet.private.*.id}"
}

resource "aws_subnet" "db" {
  count = "${length(data.aws_availability_zones.available.names)}"
  assign_ipv6_address_on_creation = false
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block = "${cidrsubnet(aws_vpc.default.cidr_block, 8, 12 + count.index)}"
  map_public_ip_on_launch = false
  vpc_id     = "${aws_vpc.default.id}"
  tags {
    Name = "db"
  }
}

output "subnets.db.ids" {
  value = "${aws_subnet.db.*.id}"
}
