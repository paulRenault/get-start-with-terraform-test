
# Description

The aim is to get start with the new terraform test functionality added in version 1.6.

# Simple plan test

This test file consists of an initial introduction to testing in terraform without a provider.

We test the result of a concatenation in a `local`

```bash
cd simple-plan-test
terraform init
terraform test
cd ..
```

The test in the file `test-ok.tftest.hcl` should pass, while the test in the file `test-nok.tftest` should not.