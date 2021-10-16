#!/bin/bash

echo "=======> initializing kubeadm :"
sudo kubeadm init --apiserver-advertise-address 192.168.5.10

echo "=======> copying config file :"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "=======> adding calico networking solution :"
kubectl apply -f https://docs.projectcalico.org/v3.20/manifests/calico.yaml

echo "=======> generating kubejoin.sh :"
kubeadm token create --print-join-command

