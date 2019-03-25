#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
fi

echo "Configuring IPtables"
cp iptables.rules /etc/iptables/iptables.rules
cp iptables.rules /etc/iptables/ip6tables.rules

echo "Configuring rsyslog"
mkdir -p /etc/rsyslog.d
cp 10-portscan.conf /etc/rsyslog.d 

echo "Configuring logrotate"
cp rotate_whoisknocking /etc/logrotate.d/whoisknocking

echo "Starting services with systemctl"
systemctl enable iptables
systemctl start iptables
systemctl enable ip6tables
systemctl start ip6tables
systemctl restart rsyslog
