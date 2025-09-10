variable "AwsAccessKey" {
}

variable "AwsSecretAccessKey" {
}

variable "AwsDefaultRegion" {
}

#for securoty group
variable "security_group" {
  type = list 
  default = ["sg-1234", "sg-3455", "sg-5555"]
}

#for map 
variable "ami_list" {
  type = map 
  default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-east-2 = "	ami-05803413c51f242b7"
    us-west-1	= "ami-0454207e5367abf01"
  }
  
}