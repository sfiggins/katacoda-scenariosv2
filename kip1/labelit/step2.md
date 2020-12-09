You should try to do a "describe" on the troublesome Pod to see if you can find  more information as to why the Pod is crashing, look at the events section.

Found anything? Probably nothing useful. We know that the container "client-go" inside the Pod "front-end" is supposed to connect with the container "sample-web" in the Pod called "back-end".

Maybe we can use the "logs" option to see if we get more clues as what might have happened:

`kubectl logs front-end`{{execute}}

From those error messages it seems this Pod is trying to reach out to the URL "http://back-end-svc:8080" but Kubernetes is saying there are no hosts under that name.

>>Q1: Do you remember what type of Service is used for internal application to reach each other? <<
[ ] LoadBalancer
[*] ClusterIP
[ ] NodePort
