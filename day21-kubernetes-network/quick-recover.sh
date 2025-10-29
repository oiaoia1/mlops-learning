#!/bin/bash
echo "🚀 快速恢复K3D环境..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
kubectl get nodes 2>/dev/null || k3d cluster create mlops --port "80:80@loadbalancer" --wait
echo "✅ 环境恢复完成！"
kubectl get nodes
