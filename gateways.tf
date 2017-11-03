resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public.0.id}"
  depends_on = ["aws_internet_gateway.default"]

  tags {
    auto-delete = "no"
  }
}

output "nat_gateway.public_ip" {
  value = "${aws_eip.nat.public_ip}"
}
