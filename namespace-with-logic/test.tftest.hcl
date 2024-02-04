variables {
    namespaces_config = {
      "n1" = {
        labels = {
          l1="l1.1"
          l2="l1.2"
        }
        annotations = {
          a1="a1.1"
          a2="a1.2"
        }
      }
      "n2" = {
        labels = {
          l1="l2.1"
          l2="l2.2"
        }
        annotations = {
          a1="a2.1"
          a2="a2.2"
        }
      }
    }
  }

run "valid_namespaces_name" {

  command = plan

  assert {
    condition     = kubernetes_namespace.test-namespace["n1"].metadata[0].name == "n1"
    error_message = "Namespace name should be n1"
  }

  assert {
    condition     = kubernetes_namespace.test-namespace["n2"].metadata[0].name == "n2"
    error_message = "Namespace name should be n2"
  }
}

run "valid_namespaces_labels" {
  command = plan

  assert {
    condition     = kubernetes_namespace.test-namespace["n1"].metadata[0].labels.l1 == "l1.1"
    error_message = "Namespace labels should be l1.1"
  }

  assert {
    condition     = kubernetes_namespace.test-namespace["n2"].metadata[0].labels.l1 == "l2.1"
    error_message = "Namespace labels should be l2.1"
  }
}

run "valid_namespaces_annotations" {
  command = plan

  assert {
    condition     = kubernetes_namespace.test-namespace["n1"].metadata[0].annotations.a1 == "a1.1"
    error_message = "Namespace labels should be a1.1"
  }

  assert {
    condition     = kubernetes_namespace.test-namespace["n2"].metadata[0].annotations.a1 == "a2.1"
    error_message = "Namespace labels should be a2.1"
  }
}