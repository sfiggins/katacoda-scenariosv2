while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

FILE=/root/manifests/deploy1.yaml

while [ ! -f "$FILE" ]
do
  sleep 1
done

kubectl apply -f /root/manifests/deploy1.yaml

sleep 2

kubectl scale --replica 5 deployment color-deployment 
