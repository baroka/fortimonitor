# build:
#  docker build -t baroka/fortimonitor .

FROM ubuntu:latest

WORKDIR /openforti

# Install packages
RUN apt-get update && apt-get install -y openfortivpn openssh-client sshpass iputils-ping jq curl iproute2 \
    pass-extension-otp && \
    apt-get clean

# Timezone (no prompt)
ARG TZ "Europe/Madrid"
ENV tz=$TZ
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "$tz" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

# Run the command on container startup
ENTRYPOINT ["/openforti/entrypoint.sh"]