You are doing really. This I will let you create the configMap object by yourself.

Try using the same approach we did with "kubecl create" but instead of creating a secret you create a configmap. I will let you figure out the command by yourself. But here are some key things:

* Name your configMap "myvars"
* Name the key for "IAmJustAnEnv" as "MYVAR".
* Name the key for "I came from the filesystem" as "var.txt"
* Name the manifest "/root/manifests/myvars.yaml"

So your configMap should contain 2 keys, and remember, the option "--from-literal" can be used multiple times in the same "create" command.

Take your time to figure the right command, if you get stuck feel free to ask for help.

If configMap was created correctly the contents of your manifest should look like this:

```html
apiVersion: v1
data:
  MYVAR: IAmJustAnEnv
  var.txt: I came from the filesystem
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: myvars
```

If that is the case, it is time to send it to the kube-API:

`kubectl apply -f /root/manifests/myvars.yaml`{{execute}}

Before we modify our Pod manifest lets delete the Pod once again since we can added environment variables on the fly on a Pod:

`kubectl delete pod sample-web`{{execute}}

Now go back to your Pod manifest (challenge-app.yaml) and let's first add just the "MYVAR" key as Environment variable. We will focus on number 3 in the next step.

I will leave you to your own devices here. Try using the sample approach we did on the previous step using "kubectl explain". I will give you a hint, setting up a configMap as environment variable is pretty much the same thing as setting up a secret. they take "almost" the exact same parameters.

Once you are happy with the your manifest apply it than check the "sample-web" tab again which it should now display:

```html
1-) My Environment Variable: IAmJustAnEnv

2-) My Environment Secret: TopSecret

3-) My File Variable: 
```

If that is the case you can move on to the final step.