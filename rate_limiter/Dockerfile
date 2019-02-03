FROM glanf/base
MAINTAINER Simon Jouet

ENV BITRATE 1mbps

COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENTRYPOINT trap : TERM INT; sleep infinity & wait