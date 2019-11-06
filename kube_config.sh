API_SERVER="https://api.sspcloudpro.co.in"
TOKEN="asbm9rjkHREcZED7d75oWv0U29bjdhn3"
CLUSTER_NAME="sspcloudpro.co.in"

kubectl config set preferences.colors true

kubectl config set-cluster ${CLUSTER_NAME} --server=${API_SERVER} --insecure-skip-tls-verify=true --namespace default
kubectl config set-credentials ${CLUSTER_NAME} --token=${TOKEN} --namespace default

# Set context to new root cluster
kubectl config set-context ${CLUSTER_NAME} --namespace default

# Print all contexts
kubectl config get-contexts
kubectl get ns
