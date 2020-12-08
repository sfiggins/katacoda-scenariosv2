#!/bin/bash

bash launch.sh
kubectl apply -f /root/manifests/manifests.yaml
echo "# Please create your service manifest in this file" > /root/myservice.yaml



