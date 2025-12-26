resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
}

# random
resource "random_pet" "pet_name" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}

