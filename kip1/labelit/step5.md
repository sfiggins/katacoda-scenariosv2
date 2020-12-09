If everything was done correctly you should see the IP address of the "back-end" Pod listed on the Endpoint field of your newly created service.

First let's find out the IP address of our Pod:

`kubectl get pod back-end -o wide`{{execute}}

Now let's if we can see the Pod in our service in the "Endpoints" field:

`kubectl describe service back-end-svc`{{execute}}

