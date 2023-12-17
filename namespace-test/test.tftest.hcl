run "valid_namespace_name" {

  command = plan

  variables {
    test_namespace_name = "test-namespace"
  }

  assert {
    condition     = kubernetes_namespace.test-namespace.metadata[0].name == "ns-test-namespace"
    error_message = "Namespace name should be ns-test-namespace"
  }

}

run "valid_namespace_creation" {

  command = apply

  variables {
    test_namespace_name = "test-namespace"
  }

  assert {
    condition     = length(kubernetes_namespace.test-namespace.id) > 0
    error_message = "Namespace not created"
  }

}