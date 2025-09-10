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

#we can pass the variables values in the cmd just like this 
#  terraform plan -var "my_name=zia" -var "age=123"