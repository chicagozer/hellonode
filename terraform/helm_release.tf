provider "helm" {
  kubernetes {
#     config_path = "~/.kube/config"
    }
}

resource "helm_release" "hellonode" {
  count = var.enabled
  namespace = var.namespace
  name       = "hellonode"
  repository = "https://chicagozer.github.io/helm-chart/"
  chart      = "hellonode"
  create_namespace = true
  
  set {
    name  = "image.tag"
    value = "${lookup(var.app_version,"hellonode")}"
  }
  set {
    name  = "image.repository"
    value = var.repository
  }
  set {
    name  = "service.port"
    value = var.service_port
  }
  set {
    name  = "service.type"
    value = var.service_type
  }
}
