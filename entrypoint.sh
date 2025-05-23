#!/bin/sh
# Entrypoint for fortimonitor

CONFIG="/etc/openfortivpn/config"

echo "fortimonitor start.."

# Check if OTP token is enabled and set it
if grep -q "^$PARAM" $CONFIG
then
	sh /home/scripts/otp.sh
	# /etc/openfortivpn/config
	#esperar a que fichero modificado durante x segundos 
	#sino se vuelve a ejecutar
fi

# Openfortipvn start from config file
sh /home/scripts/init.sh &

openfortivpn -c $CONFIG