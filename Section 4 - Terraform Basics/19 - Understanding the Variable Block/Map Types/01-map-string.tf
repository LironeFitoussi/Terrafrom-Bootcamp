variable "cats" {
  default = {
    "color" = "brown"
    "name"  = "bella"
  }
  type = map(string)
}

