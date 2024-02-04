terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
}

resource "kubernetes_namespace" "test-namespace" {
  for_each = var.namespaces_config
  metadata {
    name = each.key
    labels = each.value.labels
    annotations = each.value.annotations
  }
}