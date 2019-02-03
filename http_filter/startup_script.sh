#!/bin/bash

echo "Started http filter" >> startup.logs
iptables -A FORWARD -j NFQUEUE -p tcp --destination-port 80 --queue-num 1 
python ./data/main.py > http_filter.logs 2>&1 &