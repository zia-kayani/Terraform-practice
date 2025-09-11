variable "users" {
  type = list 
  default = ["zia","aLi","kayani" ,"umer"]

}

output  "my_result" {
  value = "user is ${var.users[1]}"
}

output "join" {
  value = "all the users are : ${join("-" ,var.users)} "
}


output "upper" {
  value = "user is  :${upper(var.users[1])}"
}


output "lower" {
  value = "user is : :${lower(var.users[1])}"
}
output "first_capitla_letter" {
  value = "all te users are :${title(var.users[1])}"
}