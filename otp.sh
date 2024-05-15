#!/bin/sh
# Get Oauth OTP token

CONFIG="/etc/openfortivpn/config"

echo "get Oauth OTP token"

TEMP="/tmp/config"
OTP="/tmp/totp-secret"
PARAM="otp = "

pass init $GPGID
pass otp insert totp-secret < $OTP
pass=`pass otp totp-secret`
cp $CONFIG $TEMP
sed -i "/^$PARAM/c\\$PARAM$pass" $TEMP
cp -f $TEMP $CONFIG