During the "post-mortem" we found out that a new feature had been pushed to production under the green tag. This new feature made the application really slow to start, as far as Kubernetes was concerned once the container is created it will start forwarding requests to the Pod, however a running container does not necessarily mean a running application. So Kubernetes was none of the wiser sending traffic to your Pods when the application was not even ready yet.

Can you think of some things that could have prevented this outage?

>>Q1: Which probe would have prevented Kubernetes to send traffic Pod that were not ready to serve traffic? <<
(*) Readiness Probe
( ) Liveness Probe