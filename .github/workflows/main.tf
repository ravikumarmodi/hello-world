provider "aws" {
  region = "us-east-1"
}
 
# Create an S3 bucket
resource "aws_s3_bucket" "demo-bucket" {
  bucket = "kyn-consult-adai-java-app-demo"
  acl    = "public-read"
 
  website {
    index_document = "index.jsp"
  }
}
resource "aws_s3_bucket_ownership_controls" "bucket-ownership" {
bucket = aws_s3_bucket.demo-bucket.id
  rule {
        object_ownership = "BucketOwnerPreferred"}
}
 
# Upload website files to the bucket
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.demo-bucket.id
  key    = "index.html"
  #source = "path/to/your/index.html"
  source = "webapp/src/main/webapp/index.jsp"

  acl    = "public-read"
}
 
# Output the website endpoint
#output "website_url" {
  #value = aws_s3_bucket.demo-bucket.website_endpoint
#}
