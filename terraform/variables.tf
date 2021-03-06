variable "aws_account" {
}

variable "region" {
  default = "us-east-2"
}

variable "namespace" {
  default = "nonprod"
}

variable "enabled" {
  default = 1
}

variable "replica_count" {
  type        = map(any)
  description = "version to deploy"
}

variable "tf_module" {
  default = "hellonode"
}

variable "tag" {
  default = "latest"
}

variable "domain" {
  default = "coxeksdemo.com"
}

variable "acm_certificate_arn" {
  default = ""
}

variable "service_port" {
  default = 80
}

variable "service_type" {
  default = "NodePort"
}

variable "repository" {
  #   default = "public.ecr.aws/d5y7k0n6/hellonode"
  default = "chicagozer/hellonode"
}

variable "app_version" {
  type        = map(any)
  description = "version to deploy"
}

variable "chart_version" {
  type        = map(any)
  description = "version to deploy"
}


