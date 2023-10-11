echo 'Create Namespace'
kubectl create namespace oracle-namespace --dry-run=client -o yaml | kubectl apply -f -
kubectl config set-context --current --namespace=oracle-namespace
echo 'Create ConfigMap'
kubectl create configmap oradb --from-env-file=oracle.properties -n oracle-namespace --dry-run=client -o yaml | kubectl apply -f -
echo 'Create Secret'
kubectl delete secret ocrsecret -n oracle-namespace
Kubectl create secret docker-registry ocrsecret \
--docker-server='container-registry.oracle.com' \
--docker-username='ron@purestorage.com' \
--docker-password='Pure20!7' \
--docker-email='ron@purestorage.com' \
-n oracle-namespace
