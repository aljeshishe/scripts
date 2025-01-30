#!/bin/bash

# this script waits signals and logs them to file
cat <<EOF > /wait.py
import time
import os
import signal
import requests
import sys
from pathlib import Path
import datetime 

def main(name):
    def message(msg):
        data = {"chat_id": 99044115,"text": f"{name}: {msg}"}
        requests.post("https://api.telegram.org/bot5803765903:AAH2ayWpVcook4JpoiHvMzgOvJCjsLItcmw/sendMessage", json=data)
        with Path(f'/{name}').open('a') as f:
            f.write(msg + ' {datetime.datetime.now()}\n')
        #print(msg)
        
    def handle_signal(signal_num, frame):
        message(f"Received signal: {signal_num}")
        if signal_num == 15:
            sys.exit(0)


    # Register the signal handler for common signals
    for i in range(1, 16):
        if i in (2, 9):
            continue
        print(f"Registering signal handler for {i}")
        signal.signal(i, handle_signal)   # SIGINT: Interrupt from keyboard (Ctrl+C)

    while True:
        time.sleep(.5)
    
if __name__ == "__main__":
    main(sys.argv[1])

EOF
chmod +x /wait.py

# option 1: run in background
python3 /wait.py background  &
# option 2: run in background with nohup and detach from terminal
nohup python3 /wait.py background_nohup > /dev/null 2>&1 & 
# option 3: run in background with nohup and detach from terminal. Start via ssh
cd /root/.ssh/
ssh-keygen -t rsa -b 4096 -N "" -f id_rsa
cat id_rsa.pub >> authorized_keys
chmod 640 authorized_keys
ssh -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no root@127.0.0.1 'nohup python3 /wait.py ssh_background_nohup > /dev/null 2>&1 &'
# option 4: run in foreground
python3 /wait.py foreground