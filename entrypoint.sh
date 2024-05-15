#!/bin/sh
# Entrypoint for fortimonitor

CONFIG="/etc/openfortivpn/config"

echo "fortimonitor start.."

# Check if OTP token is enabled and set it
if grep -q "^$PARAM" $CONFIG
then
	sh /home/scripts/otp.sh
fi

# Openfortipvn start from config file
openfortivpn -c $CONFIG && sh /home/scripts/init.sh &