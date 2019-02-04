FROM glanf/base
MAINTAINER Kyle White

RUN apt-get install -y \
    python \ 
    scapy \
    tcpdump \
    python-nfqueue \
    build-essential \
    python-dev \
    libnetfilter-queue-dev \
    python-pip

RUN pip install netfilterqueue
RUN pip install requests

ADD main.py ./data/
RUN chmod +x ./data/main.py
COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

ENTRYPOINT trap : TERM INT; sleep infinity & wait
