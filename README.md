# prometheus
## prometheus监控系统部署
```
docker-compose up -d
```

## 部署exporter
```
# 部署 docker exporter
docker rm -f cadvisor
sudo docker run -d \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=38080:8080 \
  --name=cadvisor \
  --restart=unless-stopped \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:v0.47.2

# 批量注册
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

# 部署 mysql exporter
docker run -d  --name mysql_exporter \
  -p 9104:9104 --restart=always \
  -e DATA_SOURCE_NAME="root:密码@(172.16.100.90:3306)/" \
  prom/mysqld-exporter:v0.14.0
```
