We have an simple web-server written in Go running in our Cluster. I have already create a nodePort service listening on port 30003. You can check it out by clicking on the tab called "sample-web".

Your goal is to make the home page of the application display the following:

```html
1-) My Environment Variable: IAmJustAnEnv

2-) My Environment Secret: TopSecret

3-) My File Variable: I came from the filesystem
```

The application is hardcoded to output the contents of an environment variable "MYVAR" on number 1, "MYSECRET" on number 2 and the contents of the file located under "/data/var.txt" on number 3.

 Number 1 and 3 MUST come from the same configMap named "myvars".

 Number 2 MUST come from a secret named "mysecret".

 I know it seems a lot to digest but let's try to break this down. Move on the the next.

