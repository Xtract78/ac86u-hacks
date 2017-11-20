#!/bin/sh

lan_ipaddr=$(nvram get lan_ipaddr)

# clear dnsmasq
echo "" > /tmp/resolv.dnsmasq

/sbin/service restart_dnsmasq

killall ss-tunnel
killall ss-redir

iptables -t nat -D PREROUTING -p udp --dport 53 -j DNAT --to $lan_ipaddr


