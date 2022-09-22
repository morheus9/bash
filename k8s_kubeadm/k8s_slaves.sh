#!/bin/bash

# yes | sudo bash k8s_slaves.sh

# sudo hostnamectl set-hostname "k8sworker1.example.net"
# exec bash
# sudo apt update
# sudo apt -y full-upgrade

cat <<EOT >>/etc/hosts
192.168.1.110 k8smaster.example.net k8smaster
192.168.1.111 k8sworker1.example.net k8sworker1
192.168.1.112 k8sworker2.example.net k8sworker2
EOT

echo "........................Swap........................"
sudo swapoff -a
sed -i '/swap/s/^/#\ /' /etc/fstab

echo "........................Contenerd........................"
cd /tmp/
wget https://github.com/containerd/containerd/releases/download/v1.6.8/containerd-1.6.8-linux-amd64.tar.gz
tar Cxzvf /usr/local containerd-1.6.8-linux-amd64.tar.gz

echo "........................Contenerd_service........................"
wget https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
cp containerd.service /etc/systemd/system

echo "........................Runc........................"
wget https://github.com/opencontainers/runc/releases/download/v1.1.4/runc.amd64
install -m 755 runc.amd64 /usr/local/sbin/runc

echo "........................Cni_plugins........................"
wget https://github.com/containernetworking/plugins/releases/download/v1.1.1/cni-plugins-linux-amd64-v1.1.1.tgz
mkdir -p /opt/cni/bin
tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.1.1.tgz

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
mkdir -p /etc/containerd
containerd config default>/etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
systemctl daemon-reload
systemctl enable --now containerd
systemctl daemon-reload

echo "........................Kubelet, kubeadm, kubectl........................"
sudo apt install curl wget apt-transport-https -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt update
sudo apt install kubelet kubeadm kubectl -y
sudo apt-mark hold kubelet kubeadm kubectl
systemctl enable --now kubelet

# Reboot server!!!!!!1
