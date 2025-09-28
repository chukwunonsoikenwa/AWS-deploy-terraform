pushd infra
terraform init
terraform destroy -auto-approve

popd
echo "Destruction complete!"