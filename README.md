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
#   ports:      
#     - 10443:10443
    volumes:
      - $DOCKERDIR/fortimonitor/scripts:/home/scripts
      - $DOCKERDIR/fortimonitor/work:/home/work
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID 
      - IP=
      - PORT= 
      - DOMAIN=
      - USER= 
      - PASSWORD=     

- $DOCKERDIR points to your local path for add scripts and work directory persist. 
- IP, PORT, USER and PASSWORD are variables for Forticlient access. 
- DOMAIN variable for Samba access. 

----------------------------

#docker exec -t fortimonitor ./home/scripts/log_monitor_fijo.sh

#TODO 1 -> obtener último bak de proyecto y enviarlo
#TODO 2 -> revisar registrocaidas
#TODO 3 -> bucle scripts
#TODO 4 -> si da error la conexión forticlient o telegram  :: > /dev/null 2>&1