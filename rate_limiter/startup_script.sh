#!/bin/bash

tc qdisc add dev if2 root handle 1: htb default 0xfffe
tc class add dev if2 classid 1:0xffff parent 1: htb rate 1000000000
tc class add dev if2 classid 1:0xfffe parent 1:0xffff htb rate $BITRATE ceil $BITRATE
tc qdisc add dev if1 root handle 1: htb default 0xfffe
tc class add dev if1 classid 1:0xffff parent 1: htb rate 1000000000
tc class add dev if1 classid 1:0xfffe parent 1:0xffff htb rate $BITRATE ceil $BITRATE

# More info on Hierarchical Token Bucket (HTB) queuing descipline
#		https://www.linuxjournal.com/article/7562
#			Use iperf to test
#				Server:	iperf -s 			(on destination container)
#				Client: iperf -c 10.0.0.2	(on source container)
