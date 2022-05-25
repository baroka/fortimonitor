#!/bin/sh
# Entrypoint for fortimonitor
echo "fortimonitor start.."

# docker logs
tail -f /var/log/fortimonitor.log