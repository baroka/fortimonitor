#!/bin/sh
# Entrypoint for fortimonitor
echo "fortimonitor start.."

sh /home/scripts/init.sh &

# Openfortipvn start from config file
openfortivpn -c /etc/openfortivpn/config