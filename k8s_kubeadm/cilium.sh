#!/bin/bash

# yes | sudo bash cilium.sh

echo "........................Cilium_without_kubeproxy........................"
helm repo add cilium https://helm.cilium.io/
helm install cilium cilium/cilium --version 1.12.2 \
    --namespace kube-system \
    --set kubeProxyReplacement=strict \
    --set k8sServiceHost=192.168.1.110 \
    --set k8sServicePort=6443 \
    --set prometheus.enabled=true \
    --set operator.prometheus.enabled=true \
    --set hubble.metrics.enabled="{dns,drop,tcp,flow,icmp,http}"
    
# Grafana + Prometheus
kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/v1.12/examples/kubernetes/addons/prometheus/monitoring-example.yaml
kubectl -n cilium-monitoring port-forward service/grafana --address 0.0.0.0 --address :: 3000:3000
# http://localhost:3000/


echo "........................Cilium_CLI........................"
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/master/stable.txt)
CLI_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}

cilium install

echo "........................Nginx-ingress........................"
helm upgrade --install ingress-nginx ingress-nginx \
    --repo https://kubernetes.github.io/ingress-nginx \
    --namespace ingress-nginx --create-namespace \
    --set controller.hostNetwork=true \
    --set controller.hostPort.enabled=true \
    --set controller.kind=DaemonSet \
    --set controller.service.type=ClusterIP

cilium status

kubeadm token create --print-join-command
kubectl get nodes
kubectl get pods -A

# For to start dashboard kubernetes: kubectl proxy --address='0.0.0.0' --accept-hosts='.*'
# Info from cilium without kubeproxy: https://docs.cilium.io/en/v1.9/gettingstarted/kubeproxy-free/
