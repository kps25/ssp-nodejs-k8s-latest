#!/usr/bin/env bash

API_SERVER="https://api.dev.sspcloudpro.co.in"
TOKEN="GYWwTaICieMPthhrNp0XXqH6qvHYC0xq"
CLUSTER_NAME="dev.sspcloudpro.co.in"

kubectl config set preferences.colors true
kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
kubectl config set-context dev.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=dev
# To test that configuration works
kubectl get pods --context="dev.sspcloudpro.co.in" --namespace dev
kubectl config get-contexts --namespace dev
