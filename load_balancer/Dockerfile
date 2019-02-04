# A wee DNS load balancer for GLANF

FROM glanf/base
MAINTAINER Richard Cziva

RUN apt-get install -y \
    python \ 
    scapy \
    tcpdump \
    python-nfqueue \
    build-essential \
    python-dev \
    libnetfilter-queue-dev \
    python-pip \
    dnsutils

RUN pip install netfilterqueue

ADD loadbalancer.py ./data/
RUN chmod +x ./data/loadbalancer.py
COPY ./startup_script.sh /
RUN chmod 777 /startup_script.sh

# Set your domain and webservers here!
ENV DOMAIN testwebpage
ENV WEBSERVERS 10.0.0.2 10.0.0.3 10.0.0.4 10.0.0.5 10.0.0.6 10.0.0.7 10.0.0.8 10.0.0.9 10.0.0.10

ENTRYPOINT trap : TERM INT; sleep infinity & wait
        
