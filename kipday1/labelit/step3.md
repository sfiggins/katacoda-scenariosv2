When you create a service object, Kubernetes will assign a DNS "A" record pointing the name of the service to the IP address of the service. So we must create a service with the name of "back-end-svc". From the error message we could see it trying to connect to port 8080, so that is the port our service must be listening on. Also we know the "client-go" container inside the "front-end" Pod must connect to the "back-end" container inside the "back-end" Pod. So there are 2 more things we need to find out:

* The port the "back-end" container is listening on.
* The label the "back-end" Pod is using so we can add in the label selector field in our clusterIP service manifest.

I think doing a "describe" on the "back-end" Pod should be enough to get all that missing information. If you struggle to find that information feel free to ask for help. 

If you found the missing information you can move to the next step.