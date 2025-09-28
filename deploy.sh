#!/bin/bash 


pushd infra
terraform init
terraform apply -auto-approve

bucket_name=$(terraform output -raw bucket_name)
echo "Bucket name is: $bucket_name"

cloudfront_distribution_id=$(terraform output -raw cloudfront_distribution_id)
cloudfront_domain_name=$(terraform output -raw cloudfront_domain_name)
popd

echo "CloudFront Domain Name is: $cloudfront_domain_name"
echo "CloudFront Distribution ID is: $cloudfront_distribution_id"


# copy all the files in public to the s3 bucket
aws s3 cp public/ "s3://${bucket_name}/" --recursive

# invalidate the cloudfront distribution
aws cloudfront create-invalidation --distribution-id $cloudfront_distribution_id --paths "/*"

echo "Deployment complete!"