Hopefully at this point your pod manifest is ready to be sent to the kube-api. Don't worry if you couldn't figure out just yet, if not just give a shout to your instrucutor for furhter assistance. But if you are feeling confident you can run:

`kubectl apply -f pod.yaml`{{execute}}

The command above will apply the contents of your maninest file (-f) and send to the kube-api. You can now run the command below to wathc our Pod come into life:

`watch kubectl get pod`{{execute}}
