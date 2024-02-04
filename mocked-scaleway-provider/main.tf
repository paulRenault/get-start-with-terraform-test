terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.36.0"
    }
  }
}

data "scaleway_k8s_version" "latest" {
  name = "latest"
}

resource "scaleway_k8s_cluster" "main" {
  name    = "test"
  version = data.scaleway_k8s_version.latest.name
  cni     = data.scaleway_k8s_version.latest.available_cnis[0]
  delete_additional_resources = false
}