## 批量注册上consul
```
host_name=$(hostname)
host_addr=$(ip add | grep 172.16.10 | awk '{print $2}' | cut -d / -f 1)

curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "docker-exporter-'"${host_name}"'",
  "name": "docker-exporter",
  "address": "'"${host_addr}"'",
  "port": 38080,
  "tags": ["instance='"${host_name}"'"],
  "checks": [{
    "http": "http://'"${host_addr}"':38080/metrics",
    "interval": "15s"
  }]
}'
```