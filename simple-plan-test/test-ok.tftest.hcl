# valid_string_concat.tftest.hcl



run "valid_string_concat" {

  command = plan

  variables {
    test = "test"
  }

  assert {
    condition     = local.test == "test-local"
    error_message = "Local should mactch test-local"
  }

}