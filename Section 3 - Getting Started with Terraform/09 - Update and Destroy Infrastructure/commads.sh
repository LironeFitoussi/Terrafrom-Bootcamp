# to Update Infrastructure with Terraform
# 1st, modify the resource in your .tf file (e.g., change file_permission in local.tf)
# 2nd, run the plan to see the proposed changes
terraform plan

# 3rd, apply the changes
terraform apply
# Expect output similar to:
# Plan: 0 to add, 1 to change, 0 to destroy.


# To Destroy Infrastructure with Terraform
terraform destroy
# Type 'yes' when prompted
# Expect output similar to:
# Destroy complete! Resources: 3 destroyed.