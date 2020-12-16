#!/bin/bash
# sample-web:green has a sleep of 5 minutes to simulate a breakage in the app
kubectl set image deployment color-deployment web-server=raftx/sample-web:green 
#--record=true
