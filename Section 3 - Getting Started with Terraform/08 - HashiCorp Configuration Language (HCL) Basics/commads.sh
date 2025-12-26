# First run init to initialize the directory
terraform init
# Expect output similar to:
# Initializing the backend...

# 2nd plan to see what changes will be made
terraform plan
# Expect output similar to:
# An execution plan has been generated and is shown below.
# Resource actions are indicated with the following symbols:
#   + create


# 3rd apply to create the resources
terraform apply # Type 'yes' when prompted
# Expect output similar to:
# Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

# 4th show to display the current state of resources
terraform show
# Expect output similar to:
# aws_instance.webserver:
#   id = i-0abcd1234efgh5678
#   ami = ami-0c2f25c1f66a1ff4d
#   instance_type = t2.micro
#   ...