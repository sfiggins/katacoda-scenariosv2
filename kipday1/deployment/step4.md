The development team worked really hard to have that new feature implemented and make some improvement to the startup time the application, a new version with that tag "yellow" has been created and pushed the Container Registry, however we should still implement the Readiness Probe in our deployment manifest. We decided that a simple TCP check against port 8080 should suffice for now. Let's refer to "kubectl explain" to see what options we have for the readiness probe:

`kubectl explain pod.spec.containers.readinessProbe`{{ execute HOST1 }}

We are looking for the TPC check, so our probe config should look something like this:

```html
readinessProbe:
  tcpSocket:
```

Now let's see the options for "tcpSocket":

`kubectl explain pod.spec.containers.readinessProbe.tcpSocket`{{ execute HOST1 }}

We know our app is configure to list on port 8080 so:

```html
readinessProbe:
  tcpSocket:
    port: 8080
```

The changes already has been made that checked to our source control. You can check the latest version here:

`cat /root/manifests/color-deployment_v2.yaml`{{ execute HOST1 }}

We will be running 20 replicas as before but this time with the "yellow" tag and a readiness probe so Kubernetes knows when the application is ready to accept traffic based on our TCP check on port 8080.

`kubectl apply -f /root/manifests/color-deployment_v2.yaml --record`{{ execute HOST1 }}

We can check the progress of the rolling update with the following command:

`kubectl rollout status deployment color-deployment`{{ execute HOST1 }}

If you still have that Loop going on in the bottom terminal you will see that slowly the output of our curl will start showing up "Welcome to the YELLOW app" and eventually the BLUE version will be gone.

And our "CHANGE-CAUSE" is properly recorded in the history:

`kubectl rollout history deployment color-deployment`{{ execute HOST1 }}
