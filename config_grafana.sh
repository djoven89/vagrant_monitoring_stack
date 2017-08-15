#!/bin/bash

sudo apt-get update && sudo apt-get upgrade

sudo echo 'deb https://packagecloud.io/grafana/stable/debian/ jessie main' > /etc/apt/sources.list.d/grafana.list

sudo curl https://packagecloud.io/gpg.key | sudo apt-key add -

sudo apt-get update && sudo apt-get install grafana -y

sudo systemctl start grafana-server
sudo systemctl enable grafana-server
