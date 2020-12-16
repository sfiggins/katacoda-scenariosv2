Keep an eye on your bottom terminal. The loop we started before is checking the application every second and we should be getting a successful response every time otherwise that is definitely something wrong.


Looks like the issue is getting worse and worse. Let's check the rollout history once again:

`kubectl rollout history deployment color-deployment`{{ execute HOST1 }}

We got a new REVISION but the CHANGE-CAUSE is still the same. A new REVISION is only created when a new ReplicaSet is created and that only happens when a new image is deployed.

We can confirm our Deployment created a new ReplicaSet:

`kubectl get replicaset`{{ execute HOST1 }}

Try doing a "kubectl describe" is any of the pods from our Deployment and look for the Container Image used by the Pod.

The tag says "green" but last time we check it was running the "blue" tag.

The whole application is down at the moment so let's try reverting our deployment to the blue tag since we know that was working, at least before we left for day.

`kubectl rollout undo deployment color-deployment`{{ execute HOST1 }}

The command above tells our Deployment object to revert the changes that cause the new replicaSet created, so basically returning to the original replicaSet with the container image with the blue tag.

Wait a few seconds, our Loop should start returning a successful response to all request when the rollout is finally complete. Once that is the case move to the next steps. Otherwise carry on troubleshooting and feel free to ask to help.