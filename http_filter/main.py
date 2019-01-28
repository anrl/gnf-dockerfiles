from netfilterqueue import NetfilterQueue
from scapy.all import *
import requests

url = 'http://172.17.42.1:8081/notification'

def callback(pkt):
        parsed = pkt.get_payload()
        print "Message received:\n\t" + parsed.encode('hex')

        if 'hack' in parsed:
            pkt.drop()
            print "packet dropped"  
            #requests.post(url, data="Http Filtered content")	      
            # Uncomment and set a right URL to send a notification
        else:
            pkt.accept()
        print "-------------------------------------------"

nfqueue = NetfilterQueue()
nfqueue.bind(1, callback)
try:
    print "Starting HTTP_Filter..."
    nfqueue.run()
except KeyboardInterrupt:
    print "An exceptipn occured"


