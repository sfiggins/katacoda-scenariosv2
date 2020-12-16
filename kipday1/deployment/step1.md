In this scenario we have a deployment called "color-deployment" running a web application. You can take a look at the manifest that we got straight from our version control repo:

`cat /root/manifests/color-deployment.yaml{{ execute HOST1 }}

We can see the deployment should be running 3 replicas of the image sample-web:blue in the default namespace.

Let's check the state of our pods:

`kubectl get pods`{{ execute HOST1 }}

Hmm, that is weird, we have 5 pods running instead of 3 according to our manifests. Our repo should be considered the source of truth as best practices. We know that there are not "autoscaling" mechanism in our cluster, so someone MUST have scale up our application at some point.

We can take a look at the history of our deployment to see if we can track down that change:

`kubectl rollout history deployment color-deployment`{{ execute HOST1 }}


`watch kubectl get pod`{{ execute HOST1 }}