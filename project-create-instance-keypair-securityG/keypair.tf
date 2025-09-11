
resource "aws_key_pair" "zia_key_pair" {
  key_name = "zia_key_pair"
  public_key = file("${path.module}/rsa_id.pub")
}
output "test" {
  value =   "${aws_key_pair.zia_key_pair.key_name}"
}
