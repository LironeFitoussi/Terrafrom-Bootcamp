resource local_file my-pet {
    filename = "./pets.txt"
    content  = join(" ", [for key, value in var.file-content : "${value}"])
}