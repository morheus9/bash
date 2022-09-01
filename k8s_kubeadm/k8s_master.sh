#!/bin/bash

echo "........................Update........................"

apt update && apt upgrade

echo "........................off Swap........................"

sudo swapoff -a
sed -i '/swap/s/^/#\ /' /etc/fstab

echo "........................Contenerd........................"

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sysctl --system
apt-get update
apt-get -y install containerd

mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sed '/^SystemdCgroup = true before=[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]' test.txt /etc/containerd/config.toml

systemctl restart containerd

echo "........................Kubeadm........................"

apt-get update
apt-get install -y apt-transport-https ca-certificates curl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
systemctl enable kubelet
kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

echo "........................Calico........................"

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/custom-resources.yaml
kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-

kubectl get nodes -o wide
