#!/bin/bash
set -euo pipefail

[ -e /tmp/access_tokens.yaml ] && rm /tmp/access_tokens.yaml

until $(nc -z ${master_private_ip} 6443); do
  echo "Waiting for API server to respond"
  sleep 5
done

token=$(cat /tmp/kubeadm_token)

kubeadm join --token=$${token} ${master_private_ip}:6443 \
  --discovery-token-unsafe-skip-ca-verification \
  --ignore-preflight-errors=Swap
