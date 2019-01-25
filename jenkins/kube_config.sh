#!/usr/bin/env bash


API_SERVER="https://api.k8s.sspcloudpro.co.in"
TOKEN="KPKdboxZKzVURgrq1o763hfcHgVRBfyP"
CLUSTER_NAME="k8s.sspcloudpro.co.in"

/usr/bin/kubectl config set preferences.colors true
/usr/bin/kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
/usr/bin/kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
/usr/bin/kubectl config set-context k8s.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default
/usr/bin/kubectl config use-context k8s.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=default

# To test that configuration works

/usr/bin/kubectl get pods --context="k8s.sspcloudpro.co.in" --namespace default
/usr/bin/kubectl config get-contexts --namespace default
