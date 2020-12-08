#!/bin/bash

until kubectl get nodes
do
  sleep 2
done

cat <<EOF > setup.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production

---

apiVersion: v1
kind: Namespace
metadata:
  name: staging

---

apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  namespace: production
  labels:
    app: prod
spec:
  containers:
  - image: raftx/sample-web:v1
    name: prod-app
    resources:
      requests:
        cpu: "100m"
        memory: "256Mi"
      limits:
        cpu: "250m"
        memory: "512Mi"

---

apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  namespace: staging
  labels:
    app: stage
spec:
  containers:
  - image: raftx/sample-web:v1
    name: stage-app
    resources:
      requests:
        cpu: "100m"
        memory: "4Gi"
      limits:
        cpu: "250m"
        memory: "4Gi"
EOF
kubectl apply -f setup.yaml
# File to indicate the to the foreground script that user can proceed.
echo "done" >> /opt/.backgroundfinished
