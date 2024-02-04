
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

# Namespace with some logic

## Requirements

You must have a kubeconfig file in the folder `~/.kube`

## The test

The `main.tf` will create a namespace for each object in the `namespaces_config` variable map.
As you can see in the `variables.tf` file, we take a map with the namespace name as the key and an object with labels and annotations as the value.

We will test that:
- each namespace have been created with the map key.
- each namespace have the right labels
- each namespace have the right annotations

```bash
cd namespace-with-logic
terraform init
terraform test
cd ..
```

# Test with mocked k8s scaleway

## Requirements

none

## The test

The `main.tf` will create a k8s cluster with scaleway. 
First, it will request the datasource `scaleway_k8s_version` with the thread `name=latest`. Link [here](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/data-sources/k8s_version)

The `test.tftest.hcl`, starts with the scaleway provider mock (Terraform mock doc, [here](https://developer.hashicorp.com/terraform/language/tests/mocking))
The mock is here to emulate the scaleway API call, so we don't need API keys.
When terraform mocks a provider, it generates random values. But we can specify values when we don't want random values.
This is what we do in the `mock_data` block for the `available_cnis` attribute.

Then we will verify that the `cni` for the ressource `scaleway_k8s_cluster.main` is created with the value `cilium`

```bash
cd mocked-scaleway-provider
terraform init
terraform test
cd ..
```