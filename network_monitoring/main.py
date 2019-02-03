
import requests
import time, threading
import subprocess
import os
from subprocess import Popen

delta = float(os.environ.get('DELTA'))
logFile = open("/net_monitor.stats","w+")

if delta is None:
    print 'Env has not been set properly'
    sys.exit()

# url = 'http://172.17.42.1:8081/notification'

def findIdx(array, interface):
    for idx in range(0, len(array)):
        if interface in array[idx]:
            return idx

def stat():
        threading.Timer(delta, stat).start()
        p = Popen(["netstat", "-i"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, err = p.communicate()
        x = out.split('\n')
        
        if1Idx = findIdx(x, "if1")
        if2Idx = findIdx(x, "if2")
        
        headId = findIdx(x, "Iface")
        rxInIdx = findIdx(x[headId].split(), "RX-OK")

        if1Vals = x[if1Idx].split()
        if2Vals = x[if2Idx].split()

        inbytes = if1Vals[rxInIdx]
        outbytes = if2Vals[rxInIdx]
        notif = "InBytes = " +  inbytes + ", OutBytes = " + outbytes
        logFile.write(notif + "\n")

        # if there is a running web server the stats can be forwarded there
        # requests.post(url, data=notif)

stat()

