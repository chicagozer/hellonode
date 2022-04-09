variable "region" {
  default = "us-east-2"
}

variable "namespace" {
   default = "nonprod"
}

variable "count" {
   default = 1
}

variable "tag" {
   default = "latest"
}

variable "repository" {
#   default = "public.ecr.aws/d5y7k0n6/hellonode"
   default = "chicagozer/hellonode"
}

variable "app_version" {
  type = map
  description = "version to deploy"
}


