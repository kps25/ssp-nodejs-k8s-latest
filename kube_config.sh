#!/usr/bin/env bash

API_SERVER="https://api.devops.sspcloudpro.co.in"
TOKEN="fRv1Q16Kvq4krYItSosxzsATFk5dxjmc"
CLUSTER_NAME="devops.sspcloudpro.co.in"

kubectl config set preferences.colors true
kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
kubectl config set-context devops.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default
# To test that configuration works
kubectl get pods --context="devops.sspcloudpro.co.in" --namespace default
kubectl config get-contexts --namespace default
