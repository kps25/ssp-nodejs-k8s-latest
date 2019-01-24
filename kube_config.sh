#!/usr/bin/env bash

API_SERVER="https://api.k8s.sspcloudpro.co.in"
TOKEN="Xu1SeogEfTfRavBojF9l9Txmfm5URhYj"
CLUSTER_NAME="k8s.sspcloudpro.co.in"

kubectl config set preferences.colors true
kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
kubectl config set-context dev.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default
# To test that configuration works
kubectl get pods --context="k8s.sspcloudpro.co.in" --namespace develop
kubectl config get-contexts --namespace develop
