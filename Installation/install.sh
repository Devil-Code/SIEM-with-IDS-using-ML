#!/bin/bash

echo "$---- Performing upgrade ----"

apt update -y
apt upgrade -y


echo ""
echo ""

echo "$---- Installing Zeek (Intrusion Detection System) ----"

apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python3 python3-dev swig zlib1g-dev git curl net-tools -y

echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/security:zeek.list
curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null

sudo apt update -y
sudo apt install zeek -y

export PATH=/opt/zeek/bin:$PATH

echo ""
echo ""

echo "$---- Installing Slips (Machine Learning) ----"

apt install pip -y
apt install redis-server -y
pip install maxminddb 
pip install numpy 
pip install watchdog 
pip install redis 
pip install urllib3 
pip install pandas 
pip install tzlocal 
pip install cabby 
pip install stix2 
pip install certifi 
pip install tensorflow 
pip install colorama 
pip install keras 
pip install validators 
pip install ipwhois 
pip install matplotlib 
pip install recommonmark 
pip install scikit_learn 
pip install slackclient 
pip install psutil 
pip install yara_python 
pip install six 
pip install pytest 
pip install pytest-xdist 
pip install scipy 
pip install sklearn 
pip install gitpython 
pip install setuptools 
pip install whois 
pip install wheel

git clone https://github.com/stratosphereips/StratosphereLinuxIPS

echo ""
echo ""

echo "$(tput setaf 3) ---- Installing Java 8 ----"

apt install openjdk-8-jdk -y

echo ""

echo "$---- Setting up public signing key ----"

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo ""

echo "$---- Installing the apt-transport-https package ----"

apt-get install apt-transport-https -y
apt update -y

echo "$---- Saving Repository Definition to /etc/apt/sources/list.d/elastic-7.x.list ----"

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

echo ""
echo ""

echo "$---- Installing the Elasticsearch Debian Package ----"

apt-get update -y 
apt-get install elasticsearch -y

echo ""
echo ""

echo "$---- Installing the Kibana Debian Package ----"

apt-get install kibana -y

echo ""
echo ""

echo "$---- Installing Logstash ----"

apt-get install logstash -y

echo ""
echo ""

echo "$---- Installing Filebeat ----"

apt-get install filebeat -y

filebeat modules enable zeek

echo ""
echo ""

echo "$---- Starting Elasticsearch ----"

systemctl start elasticsearch.service

echo ""
echo ""

echo "$---- Starting Kibana ----"

systemctl start kibana.service

echo ""
echo ""

echo "$---- Starting Logstash ----"

systemctl start logstash.service

echo ""
echo ""

echo "$---- Starting Filebeat ----"

systemctl start filebeat

filebeat setup -e
filebeat setup --dashboards
filebeat setup --index-management
filebeat setup --pipelines

echo ""
echo ""

echo "$---- Install Finish ----"
