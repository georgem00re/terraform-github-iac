include .env

run-terraform-init:
	terraform -chdir=terraform init

run-terraform-apply:
	TF_VAR_GH_PERSONAL_ACCESS_TOKEN=$(GH_PERSONAL_ACCESS_TOKEN) \
	TF_VAR_GH_OWNER_NAME=$(GH_OWNER_NAME) \
    terraform -chdir=terraform apply

delete-terraform-state:
	rm -rf ./terraform/.terraform/ \
	rm -rf ./terraform/terraform.tfstate \
	rm -rf ./terraform/.terraform.lock.hcl
