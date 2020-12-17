Welcome to the ConfigMap and Secret challenge!

If you keep configuration related code inside the source code of your application that means if you want to modify a configuration setting you would have to build a whole new container image. To avoid this you should decouple configuration from the application. Kubernetes helps you with that by providing the Secret and ConfigMaps objects where you can place your configuration code in it then provide to your Pods to be consumed either as a environment variable or a file which your application file

We talked the talk, but now it is time to walk the walk.