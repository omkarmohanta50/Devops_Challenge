#!/bin/bash

NAMESPACE="devops-challenge" 

POD=$(kubectl get pods -n $NAMESPACE| awk 'NR==2 {print $1}')

kubectl exec -n $NAMESPACE $POD -- id


kubectl exec -n $NAMESPACE $POD -- cat /proc/net/tcp | grep 0050

kubectl port-forward -n $NAMESPACE pod/$POD 8080:80 & sleep 3

curl http://localhost:8080


