#!/bin/bash
# 部署
docker run -d --name consul --hostname $(hostname) -v ./consul:/etc/consul.d --restart=always -p 8500:8500 consul:1.15.4

# 访问
# http://172.16.101.252:8500

# 注册
# curl --request PUT --data @node-exporter.json http://localhost:8500/v1/agent/service/register 

