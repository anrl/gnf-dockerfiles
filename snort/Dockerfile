FROM glanf/base
MAINTAINER Simon Jouet

RUN apt-get update && apt-get install -y python snort supervisor

RUN mkdir /data
ADD logrunner.py /data/
ADD supervisord.conf /etc/supervisor/
ADD snort.conf /etc/snort/
COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENTRYPOINT trap : TERM INT; sleep infinity & wait