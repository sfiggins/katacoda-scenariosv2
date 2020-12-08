#!/bin/bash

while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

cat <<EOF > setup.yaml
apiVersion: v1
kind: Pod
metadata:
  name: front-end
  labels:
    color: client-go
spec:
  containers:
  - image: raftx/sample-client:label-svc
    name: client-go

---

apiVersion: v1
kind: Pod
metadata:
  name: back-end
  labels:
    app: back-end
spec:
  containers:
  - image: raftx/sample-web:v4
    name: back-end
    ports:
    - containerPort: 8080
EOF
kubectl apply -f setup.yaml



