variable "filename" {
  default     =  "./pet.txt"
  type       = string
  description  = "The name of the file to create"
}

variable "content" {
  default     = "My Favorite pet is Mrs. Whiskers"
  type        = string
  description = "The content to write to the file"
}

variable "prefix" {
  default     = "Mrs"
  type        = string
  description = "The prefix for the random pet name"
}

variable "separator" {
  default     = "."
  type        = string
  description = "The separator for the random pet name"
}

variable "length" {
  default     = 2
  type        = number
  description = "The length of the random pet name"
}