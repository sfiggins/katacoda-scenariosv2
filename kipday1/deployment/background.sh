# Loop to wait for both nodes to be in the Ready state before proceeding.
while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

# Loop to wait for Katacoda to upload the assets files
FILE=/root/manifests/color-deployment.yaml
while [ ! -f "$FILE" ]
do
  sleep 1
done

kubectl apply -f /root/manifests/color-deployment.yaml

sleep 2
# Purposefully scaling the deployment to cause a configuration drift.
kubectl scale --replicas=5 deployment color-deployment
