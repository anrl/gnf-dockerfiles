# Allow HTTP traffic only
# Firewall example for GLANF

FROM glanf/base
MAINTAINER Richard Cziva

ENTRYPOINT iptables -A FORWARD -p tcp --dport 80 -j ACCEPT && \
        iptables -A FORWARD -p tcp -s 10.0.0.2 -j ACCEPT && \
        iptables -A FORWARD -j DROP && \
        ifinit && \
        /bin/bash
