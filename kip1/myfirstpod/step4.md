Can you tell in which namespace the POD is running?

When you pass a command to kubectl but does not specify any namespace ( with the -n option) the output will show whatever resource you request from the "default" namespace.

I am really sorry but I forgot to say we were supposed to create our first pod in the namespace called 'development'. You can check to see if the namespace already exist on Kubernetes:

`kubectl get namespaces`{{execute}}

If the namespace is not listed there we will need to create it first. I will make it easy for you this time:

`cat <<EOF > /root/manifests/dev-ns.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: development
EOF`{{execute}}

Now that you know about the "apply" option. Try running yourself to apply the namespace manifest to Kubernetes.

Once that is done we can use the "delete" option to remove the pod in the default namespace:

`kubectl delete -f /root/manifests/myfirstpod.yaml`{{execute}}

Now you can edit the file to add the "namespace" field which should go under metadata. Once done apply the manifest one again.

If everyone was done correctly you should see the new pod running on the development namespace:

`kubectl -n development get pods`{{execute}}