We were told there is an issue on the cluster no further details were provided. So first let's get familiar with a our cluster. Take a look at the namespaces currently configured:
`kubectl get namespaces`{{execute}}

You can ignore the "default" and "kube-*" namespaces for now.

Do you remember how to get Pods from a specific namespace? Since this only the second workshop here a hint:
```bash
kubeclt -n <NAMESPACE> get pods
```

Pay attention to the STATUS of the pods you find, they should all be either "Running" or "Completed" anything else might a reason to further investigate the Pod.

If the "RESTARTS" columns is anything over 0 might indicate an issue the Pod as well.