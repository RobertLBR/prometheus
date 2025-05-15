# prometheus
prometheus监控系统部署


## 部署exporter
```
# docker exporter
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

# mysql exporter
docker run -d  --name mysql_exporter \
  -p 9104:9104 --restart=always \
  -e DATA_SOURCE_NAME="root:F1krlcY6NXEG@(172.16.100.90:3306)/" \
  prom/mysqld-exporter:v0.14.0
```
