#!/bin/bash

echo "---- Starting Elasticsearch Service ----"
sudo systemctl start elasticsearch
sudo systemctl is-active -q elasticsearch && echo "elasticsearch is running" || echo "elasticsearch is not running"

echo ""
echo ""

#echo ""
#echo ""

echo "---- Starting Kibana Service ----"
sudo systemctl start kibana
sudo systemctl is-active -q kibana && echo "kibana is running" || echo "kibana is not running"

echo ""
echo ""

echo "---- Starting Filebeat Service ----"
sudo systemctl start filebeat
sudo systemctl is-active -q filebeat && echo "filebeat is running" || echo "filebeat is not running"

echo ""
echo ""

export PATH=/opt/zeek/bin:$PATH
zeekctl deploy
echo "Zeek Running"

echo ""
echo ""

sudo rm -r /home/gandhi/Project/StratosphereLinuxIPS/output/*
echo "Flushing old outputs"

echo ""
echo ""

redis-server --daemonize yes
cd /home/gandhi/Project/StratosphereLinuxIPS
pwd

sleep 10s
sudo ./slips.py -c ./config/slips.conf -f /opt/zeek/logs/current/conn.log & read -t 120 || kill $!  

echo ""
echo ""

sleep 10s

sudo /usr/share/logstash/bin/logstash --path.settings /etc/logstash/ -f /etc/logstash/conf.d/siem.conf

echo ""

echo "http://ip_addr:port"
