provider "aws" {
  access_key = var.AwsAccessKey
  secret_key = var.AwsSecretAccessKey
  region     = var.AwsDefaultRegion
}