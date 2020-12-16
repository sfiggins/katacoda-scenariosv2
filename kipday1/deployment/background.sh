while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

kubectl apply -f /root/manifests

sleep 5 

kubectl scale --replica 5 deployment color-deployment 
