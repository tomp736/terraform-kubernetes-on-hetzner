# cluster module output
output "network_id" {
  value       = module.cluster.network_id
  description = "Unique ID of the network."
}

output "private_ips" {
  value       = module.cluster.private_ips
  description = "The IPv4 addresses within the private network."
}

output "master_nodes" {
  value       = module.cluster.master_nodes.*.ipv4_address
  description = "The IPv4 addresses within the master network."
}

output "worker_nodes" {
  value       = module.cluster.worker_nodes.*.ipv4_address
  description = "The IPv4 addresses within the worker network."
}

# kubernetes module output
output "kubeconfig" {
  value       = module.kubernetes.kubeconfig
  description = "Kubectl config file contents for the cluster."
}

output "endpoint" {
  value       = module.kubernetes.endpoint
  description = "The endpoint for the Kubernetes API."
}

output "certificate_authority_data" {
  value       = module.kubernetes.certificate_authority_data
  description = "Nested attribute containing certificate-authority-data for the cluster. This is the base64 encoded certificate data required to communicate with the cluster."
}

output "client_certificate_data" {
  value       = module.kubernetes.client_certificate_data
  description = "Client certificate to communicate with the API."
}

output "client_key_data" {
  value       = module.kubernetes.client_key_data
  description = "Client key to communicate with the API."
}