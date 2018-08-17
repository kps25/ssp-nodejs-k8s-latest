#!/usr/bin/env bash

API_SERVER="https://api.dev.sspcloudpro.co.in"
TOKEN="GYWwTaICieMPthhrNp0XXqH6qvHYC0xq"
CLUSTER_NAME="dev.sspcloudpro.co.in"

/usr/local/bin/kubectl config set preferences.colors true
/usr/local/bin/kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true
/usr/local/bin/kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN}
/usr/local/bin/kubectl config set-context dev.sspcloudpro.co.in  --cluster=${CLUSTER_NAME} --user=${CLUSTER_NAME} --namespace=dev
# To test that configuration works
/usr/local/bin/kubectl get pods --context="dev.sspcloudpro.co.in" --namespace dev
/usr/local/bin/kubectl config get-contexts --namespace dev
