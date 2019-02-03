FROM glanf/base
MAINTAINER Simon Jouet

RUN apt-get update && \
    apt-get install -y \
        python \
        debconf-utils \
        supervisor 

# debconf-get-selections | grep "${snort}" > snort_deb_conf
COPY snort_deb_conf /
RUN debconf-set-selections < /snort_deb_conf \
                && apt-get update \
                && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends snort 

RUN mkdir /data
ADD logrunner.py /data/
ADD supervisord.conf /etc/supervisor/
ADD snort.conf /etc/snort/
COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

RUN touch /etc/snort/database.conf

ENTRYPOINT trap : TERM INT; sleep infinity & wait