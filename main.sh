#!/bin/bash

helm upgrade --install minio minio \
  --repo https://charts.min.io/ \
  --namespace minio --create-namespace \
  --version 5.3.0 \
  -f minio-values.yaml


helm delete my-release

helm uninstall my-release

# Проверка Pod'ов
kubectl get pods -n minio -o wide

# Проверка PVC
kubectl get pvc -n minio

# Проверка PV
kubectl get pv

# Проверка сервисов
kubectl get svc -n minio