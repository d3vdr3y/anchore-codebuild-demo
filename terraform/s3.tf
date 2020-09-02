resource "aws_s3_bucket" "codebuild_artifacts_output" {
  bucket = "${var.project}-codebuild-artifacts"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.codebuild_artifacts_output.id
  acl    = "private"
  key    = "${var.artifact_path}/"
  content_type = "application/x-directory"
}