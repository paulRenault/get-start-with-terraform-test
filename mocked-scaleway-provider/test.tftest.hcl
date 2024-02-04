mock_provider "scaleway" {
  mock_data "scaleway_k8s_version" {
    defaults = {
      available_cnis = ["cilium", "calico"]
    }
  }
}

run "valid_k8s_version" {
  command = plan

  assert {
    condition     = scaleway_k8s_cluster.main.cni == "cilium"
    error_message = "cni should be cilium"
  }
}