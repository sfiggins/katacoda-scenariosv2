There is a lot of stuff happening in the background as several Pods are being created to setup the application, so be patient as that might take a couple of minutes. You can watch the Pod creating processes with the command below:

`watch kubectl get pods`{{ execute HOST1 }}

It will take a couple of minutes for all the deployments and services to be up and running. Just keep an eye on the STATUS all the pods, you might see a couple of Pods restarting, you can run a describe on them to figure the reason why but eventually they should reach the "Running" status, then you can exit out the watch command with "CTRL + C".

The point of entry for the application is via the service called "frontend-external" which should give us a public IP address as it is a type of "LoadBalancer" service but our cluster is not running in a Cloud Provider that supports the creation of an actual Load Balancer for us (e.g GCP or AWS) but for testing purpose we can still the node port expose which is 30005 in this case. You can click on the tab called "Online Boutique" which will make a request to port 30005 on our worker node.

Explore the website, if you see something that you like feel free to add to your cart. Don't worry, I can cover the fictitious cost of your fictitious item.

If you run into any issues on the website it is time to move to the next step.