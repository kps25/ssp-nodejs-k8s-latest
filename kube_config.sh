#!/usr/bin/env bash

API_SERVER="https://api.sspcloudpro.co.in"
TOKEN="asbm9rjkHREcZED7d75oWv0U29bjdhn3"
CLUSTER_NAME="sspcloudpro.co.in"

kubectl config set preferences.colors true
kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
kubectl config set-context sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default
# To test that configuration works
kubectl get pods --context="sspcloudpro.co.in" --namespace default
kubectl config get-contexts --namespace default
