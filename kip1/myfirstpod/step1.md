As we have learned Pods are the building blocks of Kubernetes so it is essential that we know how one is created. Your first task is to create a Pod named "hello-pod"  with one container using an image called "hello-world". That is it, nothing else. 

There will be no copy and paste for now, we need to learn the hard way first. Luckily we can use "kubectl explain" in order to know exactly what we need for our first pod manifest. Since we are creating an API object of the kind Pod, run the following to see what we require for our manifest:

`kubectl explain pod`{{execute}}

I have created an empty file called "myfirstpod.yaml" on  the directory "/root/manifests". That's where you will write your manifest.