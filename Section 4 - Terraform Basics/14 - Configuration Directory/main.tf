resource "local_file" "cat" {
  filename = "${path.module}/example.txt"
  content  = "Mu Favorite pet is Mt. Whiskers"
}

resource "local_file" "example" {
  filename = "${path.module}/example.txt"
  content  = "This is an example file created by Terraform."
}