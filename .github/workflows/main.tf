provider "aws" {
  region = "us-east-1"
}
 
# Create an S3 bucket
resource "aws_s3_bucket" "demo-bucket" {
  bucket = "kyn-consult-adai-java-app-demo"
  #acl    = "public-read"
 
  website {
    index_document = "index.jsp"
  }
}

# Upload website files to the bucket
#resource "aws_s3_bucket_object" "index" {
#  bucket = aws_s3_bucket.demo-bucket.id
#  key    = "index.jsp"
#  #source = "path/to/your/index.html"
#  source = "webapp/src/main/webapp/"
#
#  #acl    = "public-read"
#}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.demo-bucket.id
  key    = "index.jsp"
  source = "webapp/src/main/webapp"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("webapp/src/main/webapp")
}
 
# Output the website endpoint
#output "website_url" {
  #value = aws_s3_bucket.demo-bucket.website_endpoint
#}
