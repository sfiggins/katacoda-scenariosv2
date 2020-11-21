You pod should have STATUS of running at this point. Can you tell in which namespace the POD is running?

When you pass a command to kubectl but does not specify any namespace ( with the -n option) the ouput will show whatever resource you request from the "default" namespace.

I am really sorry but I forgot to say we were supposed to created our first pod in the namespace called 'development'. You can check to see if the namespace already exist on Kubernetes:

`kubectl get namespaces`{{execute}}

If the namespace is not listed there we will need to create first. I will make it easy for you this time:

`cat <<EOF > dev-ns.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: development
EOF`{{execute}}
