#!/bin/bash
#
# Sends a single image to camera server.

python /home/pi/CamTransport/main_publisher.py $1

rm $1*

