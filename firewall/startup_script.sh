#!/bin/bash

echo "Started firewall" >> startup.logs
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 10.0.0.2 -j ACCEPT
iptables -A FORWARD -j DROP