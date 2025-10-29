#!/bin/bash
echo "🔧 NodePort服务测试"
echo "服务列表:"
kubectl get services | grep NodePort
echo -e "\n测试访问:"
curl -s http://$(kubectl get node -o jsonpath='{.items[0].status.addresses[0].address}'):30080 | head -5
