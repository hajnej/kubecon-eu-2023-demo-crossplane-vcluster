#!/bin/bash
MYDIR=$(dirname $0)
#kind create cluster
helm repo add argo https://argoproj.github.io/argo-helm && helm repo update
# https://github.com/cf-kubecon23-demo/cf-kubecon23-demo/issues/2121
helm install --repo https://argoproj.github.io/argo-helm --create-namespace --namespace argocd argocd argo-cd --version 5.21.0  --set "configs.cm.application\.resourceTrackingMethod=annotation" --wait
kubectl -n argocd apply -f $MYDIR/../argocd-applications
