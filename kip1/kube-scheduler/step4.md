As you could see with the "free" command the worker node as 3.9GB in total but the Pod was request 4GB which more than the total amount of RAM the worker node has. It seems someone by mistake left the request and limit at 4GB, we have been told the request should be at "256Mi" and limit at "256Mi". The manifest has already been addressed in the source repository and we pulled the updated manifest to the cluster.

We cannot update the resources at runtime so we will need to first delete the Pod to then apply the correct config:
`kubectl -n staging delete pod test-pod`{{execute}}

Now that the pod is delete take a look at the update manifest, if you are happy the changes were set correct you can than run the "apply" command to send it to the kube-api:
`cat /root/manifests/manifest.yaml`{{execute}}