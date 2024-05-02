#!/bin/sh
# Entrypoint for fortimonitor

CONFIG="/etc/openfortivpn/config"

# Check if OTP token is enabled and set it
get_otp_token() {
	local OTP="/tmp/totp-secret"
	local PARAM="otp = "
	
	if grep -q "^$PARAM" $CONFIG
	then
		pass init $GPGID
		pass otp insert totp-secret < $OTP
		pass=`pass otp totp-secret`
		sed -i "/^$PARAM/c\\$PARAM$pass" $CONFIG
	fi
}

echo "fortimonitor start.."

sh /home/scripts/init.sh &

# OTP token
#get_otp_token

# Openfortipvn start from config file
openfortivpn -c $CONFIG