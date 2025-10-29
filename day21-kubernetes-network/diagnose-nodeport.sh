#!/bin/bash
echo "🔧 NodePort诊断..."
echo "1. 服务状态:"
kubectl get svc web-nodeport
echo -e "\n2. 端点状态:"
kubectl get endpoints web-clusterip
echo -e "\n3. 端口监听:"
kubectl get node -o wide
