#!/bin/bash

# sudo hostnamectl set-hostname "k8smaster.example.net"
# exec bash
# yes | sudo bash k8s_master.sh

apt update && apt upgrade

cat <<EOT >>/etc/hosts
192.168.1.110 k8smaster.example.net k8smaster
192.168.1.111 k8sworker1.example.net k8sworker1
192.168.1.112 k8sworker2.example.net k8sworker2
EOT

echo "........................Swap........................"

sudo swapoff -a
sed -i '/swap/s/^/#\ /' /etc/fstab

echo "........................Config........................"

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

sudo sysctl --system

echo "........................Contenerd........................"

sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd

echo "........................k8s........................"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt update
sudo apt install -y kubelet kubeadm kubectl

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint=k8smaster.example.net #--skip-phases=addon/kube-proxy
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "........................Helm3........................"

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "........................Calico........................"

systemctl restart kubelet

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/custom-resources.yaml

# watch kubectl get pods -n calico-system
# kubectl get nodes
# kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-

# kubeadm token create --print-join-command
# sudo apt-mark hold kubelet kubeadm kubectl
