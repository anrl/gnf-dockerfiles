#!/bin/bash

echo "Starting snort middlebox.."
echo "alert icmp any any -> any ant (msg:"PING DETECTED. Noooooo!!!!"; sid:1000000001;)" >> /etc/snort/rules/icmp.rules
/usr/bin/supervisord > /data/supervisord.logs 2>&1 &
