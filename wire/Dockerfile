# Wire Functionality

FROM glanf/base
MAINTAINER Kyle White

COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENTRYPOINT trap : TERM INT; sleep infinity & wait

