resource "local_file" "pet" {
  filename = "${path.module}/pet.txt"
  content  = "Mu Favorite pet is Mt. Whiskers"
}

# random
resource "random_pet" "pet_name" {
  prefix    = "Mrs"
  separator = "."
  length    = 1
}

output "pet_name" {
  value = random_pet.pet_name.id
}