We have a container images called raftx/sample-web:v1. It is a very simple web-server written in Go configured to listen for request on port 8080. Your goal is to make the application display the following:

```html
My Environment Variable: IAmJustAnEnv

My Environment Secret: TopSecret

My File Variable: I came from the filesystem
```
