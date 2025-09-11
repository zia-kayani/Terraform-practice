variable "AwsDefaultRegion" {
  type = string
}

variable "ports" {
  type = list(number)
}

variable "AwsAmi" {
  type = string
}

variable "AwsInstanceType" {
  type = string
}