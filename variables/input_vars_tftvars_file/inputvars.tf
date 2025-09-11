variable "my_name" {
    type = string
  default = "zia ur rehman kiani "
}

variable "age" {
    type = number
    default = 12
} 

output "result" {
 value = "your name is: ${var.my_name} and your age is ${var.age}"
}
