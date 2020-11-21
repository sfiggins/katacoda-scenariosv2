Any API object that we created requires "apiVersion", "kind", "metadata" and "spec". We don't need to worry about "status" as that is by the kube-api. If you need to know more info about any of those fields simply add them to the explain command, for example if you want to know more about "kind":

`kubectl explain pod.kind`{{execute}}

You can keep drilling down by just appeding the extra field to your explain command, however in example above "kind" is the last field you can query since "kind" only accept a string as argument nothing else. Hint, in this case is "Pod" (with a Capital "P").

As you can see "kubectl explain" is very powerful, you pretty much have the whole API documentation at your disposal. That's why it is a good idea to get familiar with, if you need more info about a specific field there usually a link you can click to find out more about.
