#!/bin/bash

sudo dnf install msmtp -y

# hqms szia ztdw ybnj

cp ./msmtprc /etc/msmtprc
sudo chmod 644 /etc/msmtprc

sudo touch /var/log/msmtp.log
sudo chmod 666 /var/log/msmtp.log

{
echo "To: pavanktha9550@gmail.com"
echo "Subject: testing"
echo "Content-Type: text/html"
echo ""
echo "a testing email"
} | msmtp "pavanktha9550@gmail.com"