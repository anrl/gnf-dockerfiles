FROM glanf/base
MAINTAINER James Guthrie

RUN apt-get update && apt-get install -y \
            python-nfqueue

ADD load.py /usr/local/sbin/
RUN chmod +x /usr/local/sbin/load.py
COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENV DELAY 1ms
ENV LOAD_FACTOR 5.0

ENTRYPOINT trap : TERM INT; sleep infinity & wait
