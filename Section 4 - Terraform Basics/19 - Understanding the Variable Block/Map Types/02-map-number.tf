variable "pet_count" {
  default = {
    "dogs"     = "3"
    "cats"     = "1"
    "goldfish" = "2"
  }
  type = map(number)
}

