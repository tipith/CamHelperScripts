#!/bin/bash
#
# Initiate port forwards.

autossh -M 0 -o "ExitOnForwardFailure yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -v -f -N -R 8766:localhost:22 camserver
