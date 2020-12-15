We are almost there! At this stage we already have our configMap created that contains the key "var.txt" and with the value "I came from the filesystem".  We need to add that variable to the location "/data/var.txt" since our application will be reading the contents of that file to output on number 3. 

There are 2 things we need to do:

* Declare a "volume" under .spec that will be grabbing content from our configmap (just the key "var.txt")_
* Declare a "volumeMount: under .spec.containers for where we want to mount our "volume"

First let's delete the pod one last time:

`kubectl delete pod sample-web`{{execute}}

Let's once again use the "explain" flag:

`kubectl explain pod.spec.volumes`{{execute}}

There are quite a lot options there, some of them are cloud provider specific but what we are looking for is the option for configMaps which is conveniently named "configMaps", we also need to give it a name to our volume. You can start modifying the Pod manifests just under "spec" remember to indent to keep at the same level of "containers". "volumes" are options set at the Pod level and not at the container level.

```html
  volumes:
  - name: varfile
    configMap:
```

It is important to note that the name we set here is just the name we are given to the volume and NOT the name of our configMap object. It is in the following section where we reference the configMap we want to use:

`kubectl explain pod.spec.volumes.configMap`{{execute}}

Now we pass the name of our configMap under "name" and since we want just one key from our configMap and not all of them together we will need to use the "items" option as well.

```html
  volumes:
  - name: varfile
    configMap:
      name: myvars
      items:
```

`kubectl explain pod.spec.volumes.configMap.items`{{execute}}

"items" takes a list of objects (<[]Object>) where need to specify the key we want and the relative path where it will be mounted (relatively to the "volumeMounts" option we will add in a bit)

```html
  volumes:
  - name: varfile
    configMap:
      name: myvars
      items:
      - key: var.txt
        path: var.txt
```


Okay, we have now declared our volume in the Pod manifest now all we need to do is tell our container to use this volume. We do do with the volumeMount option, let's take a look at it:

`kubectl explain pod.spec.containers.volumeMounts`{{execute}}

The "name" option is the name of the volume we declared which is "varfile" and the "mountPath" need to be "/data/" since the application will read the content of "/data/var.txt" when putting together the "path" from the volume and the "mountPath" we will get "data/var.txt". The config block below should go insider "cotainers" inline with "name", "image" and a newly declared "env" as well:

```html
volumeMounts:
- name: varfile
  mountPath: /data/
```

Once you add everything to the Pod manifest go ahead and apply then open the "sample-web" that one final time:

`kubectl apply -f manifests/challenge-app.yaml`{{execute}}

If you see the below congratulations! You finished our challenge!

```html
1-) My Environment Variable: IAmJustAnEnv

2-) My Environment Secret: TopSecret

3-) My File Variable: I came from the filesystem
```

Otherwise time to troubleshoot!!

