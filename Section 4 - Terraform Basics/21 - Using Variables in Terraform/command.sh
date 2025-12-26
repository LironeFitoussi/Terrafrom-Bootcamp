terraform apply 

# Expected Output with prompts:
var.filename
  Enter a value:
var.content
  Enter a value:
var.prefix
  Enter a value:
var.separator
  Enter a value:
var.length
  Enter a value:


# or provide values in the command line
terraform apply -var="filename=/root/pets.txt" -var="content=Hello Pets" -var="prefix=my" -var="separator=-" -var="length=2"


# or using the TF_VAR_ prefix
export TF_VAR_filename="/root/pets.txt"
export TF_VAR_content="Hello Pets"
export TF_VAR_prefix="my"
export TF_VAR_separator="-"
export TF_VAR_length=2
terraform apply

# or using the terraform.tfvars file
terraform apply -var-file="terraform.tfvars"