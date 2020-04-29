#!/usr/bin/env bash

set -x

# Install elasticsearch CRD
kubectl create -f all-in-one.yaml

# Add ssd storageclass to cluster
kubectl create -f ssd.yaml

# Add namespace
kubectl create ns logging

# Create elastic stack
kubectl create -f elasticsearch_hot_warm_cold.yaml -n logging

# Create kibana stack
kubectl create -f kibana_hot_warm_cold.yaml -n logging 
