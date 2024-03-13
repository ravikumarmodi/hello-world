provider "aws" {
  region = "us-east-1"
}
 
# Create an S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "kyn_consult_adai_java_app_demo"
  acl    = "public-read"
 
  website {
    index_document = "index.html"
  }
}
 
# Upload website files to the bucket
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.demo_bucket.id
  key    = "index.html"
  source = "path/to/your/index.html"
  acl    = "public-read"
}
 
# Output the website endpoint
output "website_url" {
  value = aws_s3_bucket.demo_bucket.website_endpoint
}
