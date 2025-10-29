#!/bin/bash
echo "Kubernetes网络诊断报告"
echo "========================"

echo -e "\n1. Pod状态:"
kubectl get pods -l app=web -o wide

echo -e "\n2. Service状态:"
kubectl get services -l app=web

echo -e "\n3. Endpoints状态:"
kubectl get endpoints -l app=web

echo -e "\n4. NodePort访问测试:"
curl -s http://$(kubectl get node -o jsonpath='{.items[0].status.addresses[0].address}'):30080 | grep "Welcome" || echo "访问失败"

echo -e "\n5. 负载均衡测试:"
kubectl exec -it $(kubectl get pod -l app=web -o name | head -1) -- sh -c '
  for i in {1..3}; do 
    curl -s http://web-clusterip:80/hostname
    echo
  done
'
