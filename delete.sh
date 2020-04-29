#!/bin/bash

kubectl delete elasticsearch logging
kubectl delete kibana logging

kubectl get namespaces --no-headers -o custom-columns=:metadata.name \
  | xargs -n1 kubectl delete elastic --all -n


kubectl delete -f ssd.yaml
kubectl delete ns logging
kubectl delete -f all-in-one.yaml
