We can't simply edit the Pod at runtime to place in the new namespace, so we will need to first delete the pod, edit our pod.yaml file with theextra field in the metadata section to add specify the namespace we want the Pod to be deploy.

`kubectl delete pod hello-pod`{{execute}}

The command above might hang for a few seconds, if we goes longer than that you can press "crtl + C".

Now edit the "pod.yaml", once done run the "kubectl apply" command to push the new manifest to the kube-api once again.

If the command below show the Pod in the "running" STATUS congrats! We got our new Pod in the right namespace:

`kubectl -n development get pods`{{execute}}
