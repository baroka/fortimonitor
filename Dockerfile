# build:
#  docker build -t baroka/fortimonitor .

FROM ncleguizamon/forticlient

# Copy scripts
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh
COPY run.exp .

# Install packages
RUN apt-get update && apt-get -y install smbclient vim iputils-ping jq

# Timezone (no prompt)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "Europe/Madrid" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# Create the log file to be able to run tail
RUN touch /var/log/fortimonitor.log

# Create scripts folders
RUN mkdir /home/scripts
RUN mkdir /home/work

# Run the command on container startup
ENTRYPOINT ["/entrypoint.sh"]