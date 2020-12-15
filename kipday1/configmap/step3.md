What we need to do is set an environment variable in the pod manifest and configure it to get the value from our newly created secret. 

But before we start writing our manifest we need to delete the current Pod as adding Environment variables in the  Pod specification is not possible during runtime, so we will have to delete the port first, we have the manifest cluster already so just run:

`kubectl delete -f /root/manifests/challenge-app.yaml`{{execute}}

Now let's get some help from "kubectl explain". What we need to look for is the option "env" that goes inside ".spec.containers":

`kubectl explain pod.spec.containers.env`{{execute}}

The documentation says "env" takes a list of Object (<[]Object>) so let's start filling out our manifests. Just under "name: challenge-app" at the same indentation level add:

```html
env:
```

The option we need for "env" will be "name" (can't do it without it) and "valueFrom", since we are not specifying the variable directly on the Pod but rather grabbing from somewhere else, our secret object and remember, the application is hardcoded to look for the variable "MYSECRET" so that is what we have to name it:


```html
env:
- name: MYSECRET
  valueFrom:
```

Now we are done with .spec.containers.env and we need to find out the arguments for "valueFrom":

`kubectl explain pod.spec.containers.env.valueFrom`{{execute}}

Seems like the option we need is "secretKeyRef" which takes in Object type. Lets have a look and what it needs:

`kubectl explain pod.spec.containers.env.valueFrom.secretKeyRef`{{execute}}

So here we will need to fill out the "key" (secretenv) and the name (mysecret) so we will end up with something like this:

```html
env:
- name: MYSECRET
  valueFrom: 
    secretKeyRef:
      key: secretenv
      name: mysecret
```

Pay careful attention with the indentation, the "env" block should be in line with the options "image" and "name"  since they are all part of a list of objects that belong to "containers".


If we added every correctly we should be able to apply our manifest, if there is any type the kube-api will most likely complain and give a clue as to what we did wrong:

`kubectl apply -f /root/manifests/challenge-app.yaml`{{execute}}

If the "apply" did not return any errors run a "kubectl get pods" to see if the pod is "Running" before we have a look.

Hmm...looks like something went wrong. Any ideas why? Try running a describe to get more info.

Remember on step 2 when we "create" the secret? We had just created the manifests we had not applied, so let's do it now:

`kubectl apply -f manifests/mysecret.yaml`{{execute}}

After a few seconds the kubelet will try to start the container again and hopefully it will succeed since the secret exist now.

Now click on the "sample-web" tab to load the application. If we are on the right track we should see this:

```html
1-) My Environment Variable: 

2-) My Environment Secret: TopSecret

3-) My File Variable: 
```

If the page matches the above well done!! Move to the next step, otherwise carry on troubleshooting. If you get stuck feel free to give a shout to instructor or the rest of the group.