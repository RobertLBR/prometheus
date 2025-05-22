docker run -d --name alertmanager \
  --hostname alertmanager \
   -p 9093:9093 \
  -v $(pwd)/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
  -v $(pwd)/template:/etc/alertmanager/template \
  prom/alertmanager
