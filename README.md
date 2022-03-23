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

To get the kube config for admin, I just scp it.

``` bash
scp -o root@<MasterIp>:.kube/config ~/.kube/config
```