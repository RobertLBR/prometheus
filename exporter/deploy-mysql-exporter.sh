# 部署 mysql exporter
docker run -d  --name mysql_exporter \
  -p 9104:9104 --restart=always \
  -e DATA_SOURCE_NAME="root:密码@(172.16.100.90:3306)/" \
  prom/mysqld-exporter:v0.14.0