#!/bin/sh
# Entrypoint for fortimonitor

CONFIG="/etc/openfortivpn/config"

echo "fortimonitor start.."

# Check if OTP token is enabled and set it
if grep -q "^$PARAM" $CONFIG
then
	find=''
	while [ -z "$find" ]; do
		find=`find $CONFIG -mmin -1 -type f -print`
		if [ -n "$find" ]; then
			sh /home/scripts/otp.sh
		fi
	done
fi

# Openfortipvn start from config file
sh /home/scripts/init.sh &

openfortivpn -c $CONFIG