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

wget https://github.com/containerd/containerd/releases/download/v1.6.2/containerd-1.6.2-linux-amd64.tar.gz
tar Cxzvf /usr/local containerd-1.6.2-linux-amd64.tar.gz
systemctl daemon-reload
systemctl enable --now containerd

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
#sudo apt update
#sudo apt install -y containerd.io

echo "........................Runc........................"

wget https://github.com/opencontainers/runc/releases/download/v1.1.1/runc.amd64
install -m 755 runc.amd64 /usr/local/sbin/runc

echo "........................CNI_plugins........................"

sudo mkdir -p /opt/cni/bin/
sudo wget https://github.com/containernetworking/plugins/releases/download/v1.1.1/cni-plugins-linux-amd64-v1.1.1.tgz
sudo tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.1.1.tgz

echo "........................Config_for_k8s........................"

mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
systemctl restart containerd

#cat <<EOF | sudo tee -a /etc/containerd/config.toml
#[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
#[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
#SystemdCgroup = true
#EOF
#sudo sed -i 's/^disabled_plugins \=/\#disabled_plugins \=/g' /etc/containerd/config.toml
#sudo systemctl restart containerd

echo "........................Kubeadm........................"

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
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
