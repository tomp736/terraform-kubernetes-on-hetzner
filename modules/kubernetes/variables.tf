# kubernetes/variables.tf

# GENERAL
variable "hcloud_token" {
  type = string
}

variable "hcloud_dns_token" {
  type = string
}

# NETWORK
variable "network_id" {
  type = string
}

variable "private_ips" {
  type = list(any)
}

# MASTER NODES
variable "master_nodes" {
  type = list(any)
}

# WORKER NODES
variable "worker_nodes" {
  type = list(any)
}

# KUBERNETES
variable "kubernetes_version" {
  type = string
}

variable "cluster_name" {
  type = string
}