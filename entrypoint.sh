#!/bin/sh
# Entrypoint for fortimonitor

CONFIG="/etc/openfortivpn/config"

echo "fortimonitor start.."

# Check if OTP token is enabled and set it
if grep -q "^$PARAM" $CONFIG
then
	find=''
	while [ -z "$find" ]; do
		sh /home/scripts/otp.sh
		find=`find $CONFIG -mmin -1 -type f -print`
	done
fi

# Openfortipvn start from config file
sh /home/scripts/init.sh &

openfortivpn -c $CONFIG