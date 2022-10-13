# build:
#  docker build -t baroka/fortimonitor .

FROM ubuntu:latest

WORKDIR /work

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

# Install packages
RUN apt-get update && apt-get -y install openfortivpn smbclient vim iputils-ping jq curl iproute2

# Timezone (no prompt)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "Europe/Madrid" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Run the command on container startup
ENTRYPOINT ["/work/entrypoint.sh"]