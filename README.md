
# Description

The aim is to get start with the new terraform test functionality added in version 1.6.

I assume that you are using the decontainer

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

# Namespace test

## Requirements

You must have a kubeconfig file in the folder `~/.kube`

## The test

The `main.tf` will create the `ns-test-namespace` namespace.

First, we will test that the namespace name matches what we want.
We will use `command = plan` because we don't want the namespace to be created just to evaluate this condition.

Then we will verify that the namespace is created by checking that an attribute assigned after creation is not empty, such as the `id`.
To create the namespace, we will use `command = apply`.

To ensure that the namespace is actually created, you can open a second terminal and run the command `kubectl get namespaces`.

```bash
cd namespace-test
terraform init
terraform test
cd ..
```