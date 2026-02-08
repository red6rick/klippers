#!/bin/bash

GATEWAY="10.0.1.1"
DNS="10.0.1.1"
BITS=24

if [ $# -ne 2 ]; then
    echo "usage: $0 <interface> <ip_address>"
    exit 1
fi

IFACE=$1
IP=$2

# Find connection name for interface
CON=$(nmcli -t -f NAME,DEVICE con show --active | grep ":$IFACE$" | cut -d: -f1)

if [ -z "$CON" ]; then
    echo "no active connection found for $IFACE"
    echo "available connections:"
    nmcli con show
    exit 1
fi

echo "seting $IFACE ($CON) to $IP/$BITS gw=$GATEWAY dns=$DNS"

nmcli con mod "$CON" ipv4.addresses "$IP/$BITS" || exit 1
nmcli con mod "$CON" ipv4.gateway "$GATEWAY" || exit 1
nmcli con mod "$CON" ipv4.dns "$DNS" || exit 1
nmcli con mod "$CON" ipv4.method manual || exit 1
nmcli con up "$CON" || exit 1

echo "set $IFACE ($CON) to $IP/$BITS gw=$GATEWAY dns=$DNS"

