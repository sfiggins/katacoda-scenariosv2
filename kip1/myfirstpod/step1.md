As we have learned Pods are the building blocks of Kubernetes so it is essential that we know how one is created. Your first task is to create a Pod named "hello-pod"  with one container only using he image called hello-word. That is it, nothing else more. 

There will be no copy and paste for now, we need to learn the hard way first. Luckily we can use "kubectl explain" in order to know exactly what we need to our first pod manifest. Since we are created a API object of the kind Pod, run the following to see what we require for our manifest:
kubectl explain pod
```{{execute HOST1}}

