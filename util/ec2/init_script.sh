#!/bin/bash

cat <<EOF > /killer.sh
#!/bin/bash
trap "curl -X POST -d chat_id=99044115 -d text=killed https://api.telegram.org/bot5803765903:AAH2ayWpVcook4JpoiHvMzgOvJCjsLItcmw/sendMessage ; pkill -15 -f wait.py" SIGTERM; while true; do sleep 1; done
EOF
chmod +x /killer.sh

cd /root/.ssh/
ssh-keygen -t rsa -b 4096 -N "" -f id_rsa
cat id_rsa.pub >> authorized_keys
chmod 640 authorized_keys
ssh -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no root@127.0.0.1 'nohup /killer.sh > /log.log 2>&1 &'

cat <<EOF > /wait.py
import time
import os
import signal
import requests
# Define the signal handler function

def main():
    def message(msg):
        data = {"chat_id": 99044115,"text": msg + " GRACHEV bash"}
        requests.post("https://api.telegram.org/bot5803765903:AAH2ayWpVcook4JpoiHvMzgOvJCjsLItcmw/sendMessage", json=data)
        
    def handle_signal(signal_num, frame):
        msg = f"Received signal: {signal_num}"
        print(msg)
        message(msg)


    message("instance started")
    # Register the signal handler for common signals
    for i in range(1, 16):
        if i in (2, 9):
            continue
        print(f"Registering signal handler for {i}")
        signal.signal(i, handle_signal)   # SIGINT: Interrupt from keyboard (Ctrl+C)

    # Additional signals can be registered as needed

    print(f"Waiting for signals... on PID: {os.getpid()} (Press Ctrl+C to send SIGINT)")
    while True:
        time.sleep(.5)
    
if __name__ == "__main__":
    main()

EOF
nohup python3 /wait.py &


