# Terraform Kubernetes on Hetzner

This is just a quick terraform project used for training and dev purposes - use it at your own risk!


1. Get your hcloud tokens and keys setup.

2. Run terraform apply. 


## Example using tfvars:

1) Create a similiar file in repository root folder. 

``` cluster.tfvars
cluster_name = "cluster-01"
hcloud_token = ""
hcloud_dns_token = ""
hcloud_ssh_keys = [""]
```

- cluster_name: Name set for the cluster wihch appears in kube config
- hcloud_token: Token can be created within hetzner project
- hcloud_dns_token: Token can be created with hetzner dns portal
- hcloud_ssh_keys: Name of the ssh key to use. You must import these ssh-keys to hetzner yourself.

2) Run 

``` bash
$ terraform apply -var-file=local.tfvars --auto-approve
```

## Hint

As a part of apply, the final config is copied from master to ~/.kube/config-files/{cluster-name}.yaml

It helps to have the following [script](https://medium.com/@alexgued3s/multiple-kubeconfigs-no-problem-f6be646fc07d) sourced in bashrc. These configs should then be automatically be picked up.

``` bash
#!/usr/bin/env bash
# If there's already a kubeconfig file in ~/.kube/config it will import that too and all the contexts
DEFAULT_KUBECONFIG_FILE="$HOME/.kube/config"
if test -f "${DEFAULT_KUBECONFIG_FILE}"
then
  export KUBECONFIG="$DEFAULT_KUBECONFIG_FILE"
fi
# Your additional kubeconfig files should be inside ~/.kube/config-files
ADD_KUBECONFIG_FILES="$HOME/.kube/config-files"
mkdir -p "${ADD_KUBECONFIG_FILES}"
OIFS="$IFS"
IFS=$'\n'
for kubeconfigFile in `find "${ADD_KUBECONFIG_FILES}" -type f -name "*.yml" -o -name "*.yaml"`
do
    export KUBECONFIG="$kubeconfigFile:$KUBECONFIG"
done
IFS="$OIFS"
```