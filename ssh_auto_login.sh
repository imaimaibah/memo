#!/bin/bash

username="root"
host="localhost"

PASSWORD="password"

temp=$(mktemp)
echo "echo $PASSWORD" > $temp
chmod +x $temp
SSH_ASKPASS=$temp DISPLAY=dummy setsid ssh -o StrictHostKeyChecking=no ${username}@${host} ls
rm -f $temp
