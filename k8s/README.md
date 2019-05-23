# To create a new namespace
kubectl create namespace <namespace-name>


## To get the login detals of the dashboard and creds of the Cluster
kubectl config view --minify

## To get the cluster details
Kops get clusters


## To know the nodes details $
kubectl get nodes –o wide

## To know the pods details $
kubectl get pods
