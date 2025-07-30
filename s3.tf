resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = "${local.s3-sufix}"

  tags = {
    Name        = "${local.s3-sufix}"
    Environment = "Dev"
  }
}