

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace_v1" "devops" {
  metadata {
    name = "devops-challenge"
  }
}

resource "kubernetes_resource_quota_v1" "memory_quota" {
  metadata {
    name = "mem-quota"
namespace= kubernetes_namespace_v1.devops.metadata[0].name

  }
  spec {
    hard = {
      "limits.memory" = "512Mi"
    }
  }
}

