Now lets have a look at our pods again:

`kubectl get pods`{{execute}}

You might still see the status of the "front-end" Pod as "CrashLoopBackOff", whenever a Pod fails to start the Kubelet will keep trying to start the Pod based on the "restartPolicy" in the Pod spec which by default is "Always", but it will do so in a exponential backoff fashion (10s, 20s, 40s...).

For that reason you might not see the Pod STATUS as "Running" straight away. So be patient.

If after a couple of minutes nothing happens let your instructor know so we can figure what happened together. Otherwise you are done!