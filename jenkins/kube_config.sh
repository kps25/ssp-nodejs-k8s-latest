#!/usr/bin/env bash

API_SERVER="https://api.k8s.sspcloudpro.co.in"
TOKEN="7IR4vOtqNKs7VnbATFUo2ZFgJ0IfW7gT"
CLUSTER_NAME="k8s.sspcloudpro.co.in"

/usr/local/bin/kubectl config set preferences.colors true
/usr/local/bin/kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
/usr/local/bin/kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
/usr/local/bin/kubectl config set-context k8s.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default
# To test that configuration works
/usr/local/bin/kubectl get pods --context="k8s.sspcloudpro.co.in" --namespace default
/usr/local/bin/kubectl config get-contexts --namespace default
