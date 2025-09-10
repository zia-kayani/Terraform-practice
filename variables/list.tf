variable "users" {
  type = list 
  default = ["zia","ur rehman","kayani"]

}

output  "my_result" {
  value = "user is ${var.users[1]}"
}
