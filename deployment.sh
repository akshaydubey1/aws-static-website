#!/bin/bash

# Variables
BUCKET_NAME=your-unique-bucket-name
WEBSITE_DIR=./your-website-directory

# Create S3 bucket
aws s3 mb s3://$BUCKET_NAME

# Configure S3 bucket for website hosting
aws s3 website s3://$BUCKET_NAME --index-document index.html

# Upload website files
aws s3 sync $WEBSITE_DIR s3://$BUCKET_NAME

# Set bucket policy
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://bucket-policy.json

# Output the website URL
echo "Website URL: http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"
