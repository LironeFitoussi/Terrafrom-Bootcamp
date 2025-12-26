resource "local_file" "cat" {
  filename = "${path.module}/example.txt"
  content  = "Mu Favorite pet is Mt. Whiskers"
}