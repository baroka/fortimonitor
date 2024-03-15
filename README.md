```shell
Docker image for Forticlient with FTP 

PREREQUISITES
 - Docker installed

INSTALLATION
 - Docker compose example: 

# Fortimonitor
  fortimonitor:
    container_name: fortimonitor
    image: baroka/fortimonitor:latest
    restart: unless-stopped
    cap_add:
      - net_admin
    devices:
      - /dev/ppp
    networks:
      - t2_proxy   
    security_opt:
      - no-new-privileges:true      
    volumes:
      - $DOCKERDIR/fortimonitor/config/config:/etc/openfortivpn/config
      - $DOCKERDIR/fortimonitor/config/known_hosts:/root/.ssh/known_hosts
      - $DOCKERDIR/fortimonitor/config/totp-secret:/tmp/totp-secret
      - $DOCKERDIR/fortimonitor/config/gnupg:/root/.gnupg
      - $DOCKERDIR/fortimonitor/scripts:/home/scripts
      - $DOCKERDIR/fortimonitor/work:/home/work
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID  
      - GPGID=$GPGID # Generate with: gpg --full-generate-key (without passphrase) and save .gnupg dir

- config forticlient file example: 
  host = xxx
  port = xxx
  username = xxx
  password = xxx
  trusted-cert = xxx
  otp = xxx [optional]

- Needs init scripts at /home/scripts/init.sh (can be anything)
```
