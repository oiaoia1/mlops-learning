#!/bin/sh
echo "=== 能力验证 ==="
cat /proc/1/status | grep Cap
echo "=== 用户身份 ==="  
id
echo "=== 进程信息 ==="
ps aux | head -10
echo "=== 网络监听 ==="
netstat -tlnp
