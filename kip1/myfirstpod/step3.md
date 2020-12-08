Is your Pod manifest ready to be sent to the kube-api. Don't worry if you couldn't figure out just yet, if not just give a shout to your instructor for assistance. But if you are feeling confident you can run:

`kubectl apply -f /root/manifests/myfirstpod.yaml`{{execute}}

The command above will apply the contents of your manifest file (-f) and send to the kube-api. You can now run the command below to watch our Pod come into life:

`watch kubectl get pod`{{execute}}

(to quit out of the watch command press crtl+C)

If the STATUS is displaying "Running" congrats! Your first ever Pod is up and running. If there some other weird STATUS we need figure it out what happen. The describe command can show us more information about what is going on:

`kubectl describe pod hello-pod`{{execute}}