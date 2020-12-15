We will need to create a configMap and a secret. Let's start with the secret first.

We could write a secret manifest from scratch then submit to the API or we could create the command imperatively. The downside of the imperative approach is that it is hard to trace back and it goes against the declarative paradigm.  What we can do is issue an imperative command to output in YAML format, then we can use that YAML file to check-in to our version control repo and apply to the cluster. That way our change is documented and can be refer back to in the future.

`kubectl create secret generic mysecret --dry-run --from-literal=secretenv=TopSecret -o yaml > /root/manifests/mysecret.yaml`{{ execute}}

What we just done was create an "secret"  API object of the type of the type generic and inside it contains a key called "secretenv" which has the value of "TopSecret". The dry-run flag means nothing was actually sent to the kube-API, instead we sent the output to a file called "mysecret.yaml".

Remember that any values inside a "secret" are encoded in base64 so don't worry if you see random string as the value for our key.

Now we have our secret created. We just need make sure our container can consume the value of the key "secretenv" as an environment variable called MYSECRET.

You can now go to the next step.