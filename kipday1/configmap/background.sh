while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

cat <<EOF > setup.yaml

apiVersion: v1
kind: Pod
metadata:
  name: sample-web
  labels:
    app: config
spec:
  containers:
  - image: raftx/sample-web:configmap
    name: challenge-app

---

apiVersion: v1
kind: Service
metadata:
  name: web-svc
spec:
  type: NodePort
  selector:
    app: config
  ports:
  - port: 8080
    targetPort: 8080
    nodePort: 30003
EOF
kubectl apply -f setup.yaml
