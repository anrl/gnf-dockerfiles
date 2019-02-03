# Allow HTTP traffic only
# Firewall example for GLANF

FROM glanf/base
MAINTAINER Richard Cziva

COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENTRYPOINT trap : TERM INT; sleep infinity & wait
