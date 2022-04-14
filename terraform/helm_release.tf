provider "helm" {
  kubernetes {
    #     config_path = "~/.kube/config"
  }
}

/*
data "aws_acm_certificates" "issued" {
  count = var.enabled
  domain   = "*.${var.namespace}.${var.domain}"
  statuses = ["ISSUED"]
}
*/

resource "helm_release" "hellonode" {
  count            = var.enabled
  namespace        = var.namespace
  name             = var.tf_module
  repository       = "https://chicagozer.github.io/helm-chart/"
  chart            = "hellonode"
  version          = lookup(var.chart_version, "hellonode")
  create_namespace = true

  set {
    name  = "image.tag"
    value = lookup(var.app_version, var.tf_module)
  }

  set {
    name  = "replicaCount"
    value = lookup(var.replica_count, var.tf_module)
  }

  set {
    name  = "fullnameOverride"
    value = var.tf_module
  }

  set {
    name  = "image.repository"
    value = "${var.aws_account}.dkr.ecr.${var.region}.amazonaws.com/hellonode"
  }
  set {
    name  = "service.port"
    value = var.service_port
  }
  set {
    name  = "service.type"
    value = var.service_type
  }
  set {
    name  = "ingress.use_tls"
    value = true
  }
  set {
    name  = "ingress.enabled"
    value = false
  }
  set {
    name = "ingress.certificateARN"
    #   value = data.aws_acm_certificate.issued.0.arn
    value = var.acm_certificate_arn
  }

}
