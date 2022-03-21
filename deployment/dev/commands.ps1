# get terraform version
terraform version

# get terraform commands
terraform

# init terraform's Azure provider (main.tf)
terraform init

# fmt terraform file (main.tf)
terraform fmt

# validate terraform file (main.tf)
terraform validate

# plan and preview terraform changes
terraform plan

# Terraform Visual representation
#terraform plan -out plan.out
#terraform show -json plan.out > plan.json

# deploy terraform infra
terraform apply

# display the terraform infra values
terraform show

# destroy infra
#terraform destroy