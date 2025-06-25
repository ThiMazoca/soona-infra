resource "aws_s3_bucket" "media" {
  bucket        = "soona-media-docs"
  force_destroy = true
}
