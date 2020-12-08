This is a summary of the essential info your service manifest should contain:

- Name: back-end-svc
- Port: 8080 (the one the service will be listening on)
- Target Port: 8080 (the one the service will the forwarding to)
- Label Selector: app = back-end

Write your manifest on the file called "myservice.yaml" using the terminal editor. Once done use the "kubectl apply" to send it to the kube-api.

If you make any typos the "kube-api" will most likely catch that and return an error for you. And remenber, "kubectl explain" is your friend. 

If you managed to submit with no error move on to the next step.