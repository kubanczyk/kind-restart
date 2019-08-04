#!/bin/bash

sudo -H kind delete cluster 2> /dev/null
sudo -H kind create cluster --config ./kind.yaml

mkdir -p ~/.kube
sudo -H kind get kubeconfig --name="kind" > ~/.kube/kind
export KUBECONFIG=~/.kube/kind
kubectl cluster-info

