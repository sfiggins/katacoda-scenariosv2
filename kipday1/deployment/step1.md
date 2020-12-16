In this scenario we have a deployment called "color-deployment" running a web application. You can take a look at the manifest that we got straight from our source control repo:

`cat /root/manifests/color-deployment.yaml`{{ execute HOST1 }}

We can see the deployment should be running 3 replicas of the image sample-web:blue in the default namespace.

Let's check the state of our pods:

`kubectl get pods`{{ execute HOST1 }}

Hmm, that is weird, we have 5 pods running instead of 3 according to our manifests. Our repo should be considered the source of truth as best practices. We know that there is no "autoscaling" mechanism in our cluster, so someone MUST have scaled up our application at some point.

We can take a look at the history of our deployment to see if we can track down that change:

`kubectl rollout history deployment color-deployment`{{ execute HOST1 }}

We can see only one REVISION and the CHANGE-CAUSE is the command that we used to deploy the application. Every time you take an action on the deployment with the flag "--record"  the CHANGE-CAUSE is updated with the command used. So it looks like someone scale the deployment manually without the "--record" flag.

This is not ideal since it is very hard to track who and why the change was made and we start going into a configuration drift comparing with our source control repo.

Just for the of demonstration let's scale up the application to 20 replicas, don't worry, our cluster can handle:

`kubectl scale --replicas=20 deployment color-deployment --record`{{ execute HOST1 }}

Since we used the "--record" flag we can see our command was saved on the history:

`kubectl rollout history deployment color-deployment`{{ execute HOST1 }}

It's late and you decide to go home and figure tomorrow who was making changes to the cluster and let them know about some best practices to follow.

Leave command below running, it will be useful in a second, you should be seeing "Welcome to the BLUE app" if the app is working properly:

`while true; do curl 127.0.0.1:30001; sleep 1; done`{{ execute HOST2 }}

You are sound asleep when you get a phone call. Looks like our monitoring system is picking up some errors coming from our BLUE app. Move on to the next step to start the investigation.
