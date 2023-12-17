terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.24.0"
    }
  }
}

resource "kubernetes_namespace" "test-namespace" {
  metadata {
    name = "ns-${var.test_namespace_name}"
  }
}