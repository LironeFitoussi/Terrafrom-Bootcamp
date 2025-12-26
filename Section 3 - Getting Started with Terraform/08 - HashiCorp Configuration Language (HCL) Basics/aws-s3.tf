resource "aws_s3" "data" {
  filename = "webserver-bucket-org-2207"
  acl      = "private"
}