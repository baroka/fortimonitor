#!/bin/sh
# Entrypoint for fortimonitor
echo "init.."

# docker logs
tail -f /var/log/fortimonitor.log