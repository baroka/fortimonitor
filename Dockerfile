# build:
#  docker build -t baroka/fortimonitor .

FROM ubuntu:latest

WORKDIR /work

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

# Install packages
RUN apt-get update && apt-get install -y openfortivpn openssh-client iputils-ping jq curl iproute2
# smbclient

# Timezone (no prompt)
ARG TZ "Europe/Madrid"
ENV tz=$TZ
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "$tz" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Run the command on container startup
ENTRYPOINT ["/work/entrypoint.sh"]