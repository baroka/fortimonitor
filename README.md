```shell
Docker image for Forticlient with Samba 

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
      - /dev/net/tun
    networks:
      - t2_proxy   
    security_opt:
      - no-new-privileges:true      
    volumes:
      - $DOCKERDIR/fortimonitor/config/config:/etc/openfortivpn/config
      - $DOCKERDIR/fortimonitor/scripts:/home/scripts
      - $DOCKERDIR/fortimonitor/work:/home/work
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID   

- config forticlient file example: 
  host = xxx
  port = xxx
  username = xxx
  password = xxx
  trusted-cert = xxx

- Needs init scripts at /home/scripts/init.sh (can be anything)
```
