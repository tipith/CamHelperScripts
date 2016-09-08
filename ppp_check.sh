#!/bin/bash
#
# Pings google.com and resets ppp connection in case of failure.

HOST=www.google.com

DATE=`date`
PINGRES=`ping -c 2 $HOST 2>&1`
PLOSS=`echo $PINGRES : | grep -oP '\d+(?=% packet loss)'`
IS_UNKNOWN=`echo $PINGRES : | grep -oP '(unknown host)'`

if [[ ( "$IS_UNKNOWN" = "unknown host" || "100" -eq "$PLOSS" ) ]];
then
    echo "$DATE : ppp0 disconnected"
    /sbin/ifdown ppp0
    /sbin/ifup ppp0
    echo "$DATE : ppp0 was restarted"
else
    echo "$DATE : ppp0 connection ok"
fi
