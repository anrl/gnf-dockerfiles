#!/bin/bash

tc qdisc add dev if1 root netem delay $DELAY 
tc qdisc add dev if2 root netem delay $DELAY 
iptables -A FORWARD -j NFQUEUE 
python /usr/local/sbin/load.py > /load.logs 2>&1 &