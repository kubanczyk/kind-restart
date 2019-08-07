#!/bin/bash

sudo -H kind delete cluster 2> /dev/null
sudo -H kind create cluster --config ./kind.yaml

mkdir -p ~/.kube
sudo -H kind get kubeconfig --name="kind" > ~/.kube/kind
export KUBECONFIG=~/.kube/kind
kubectl cluster-info

curl https://get.helm.sh/helm-v3.0.0-alpha.2-linux-amd64.tar.gz | tar zvxf - linux-amd64/helm 
sudo mv linux-amd64/helm /usr/local/bin/helm
rmdir linux-amd64/
helm init
helm repo update

echo -------------------------------------
echo --- Now you can try:              ---
echo 
echo export KUBECONFIG=~/.kube/kind
echo
echo helm search nginx
echo helm install mymariadb stable/mariadb
echo -------------------------------------

