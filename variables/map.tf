variable "user_age" {
    type = map  
    default = {
        zia = 23
        naila = 18
    }
  
}

variable "user_name" {
}
output "agegroup" {
  value = "user ${var.user_name} age is ${lookup(var.user_age , var.user_name)}"
}
