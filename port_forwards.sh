#!/bin/bash
#
# Initiate port forwards.


if [ `hostname -s` == 'alho1' ]; then
    port='8765'
fi


if [ `hostname -s` == 'alho2' ]; then
    port='8766'
fi

ssh_params='-M 0 -o "ExitOnForwardFailure yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -v -f -N -R'

autossh $ssh_params $port:localhost:22 camserver
