#!/bin/bash
# 注册和删除consul上的服务
# 清理实例
# curl -X PUT "http://172.16.100.98:8500/v1/agent/service/deregister/实例id"

###### node-exporter
# 注册 ai 实例
curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "node-exporter-ai",
  "name": "node-exporter",
  "address": "172.16.100.98",
  "port": 9100,
  "tags": ["instance=ai"],
  "checks": [{
    "http": "http://172.16.100.98:9100/metrics",
    "interval": "15s"
  }]
}'

###### mysql-exporter
# 注册 etl 数据库实例
curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "mysql-exporter-etl",
  "name": "mysql-exporter",
  "address": "172.16.100.90",
  "port": 9104,
  "tags": ["instance=etl"],
  "checks": [{
    "http": "http://172.16.100.90:9104/metrics",
    "interval": "15s"
  }]
}'

###### docker-exporter
# 注册 etl 的docker监控实例
curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "docker-exporter-etl",
  "name": "docker-exporter",
  "address": "172.16.100.90",
  "port": 38080,
  "tags": ["instance=etl"],
  "checks": [{
    "http": "http://172.16.100.90:38080/metrics",
    "interval": "15s"
  }]
}'

# 注册 ai 的docker监控实例
curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "docker-exporter-ai-01",
  "name": "docker-exporter",
  "address": "172.16.100.98",
  "port": 38080,
  "tags": ["instance=ai"],
  "checks": [{
    "http": "http://172.16.100.98:38080/metrics",
    "interval": "15s"
  }]
}'

# 注册 dev 的docker监控实例
curl -X PUT http://172.16.100.98:8500/v1/agent/service/register -H "Content-Type: application/json" -d '{
  "id": "docker-exporter-dev",
  "name": "docker-exporter",
  "address": "172.16.100.50",
  "port": 38080,
  "tags": ["instance=dev"],
  "checks": [{
    "http": "http://172.16.100.50:38080/metrics",
    "interval": "15s"
  }]
}'
