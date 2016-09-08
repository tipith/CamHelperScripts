#!/bin/bash
#
# Forwards a local www port to remote server.

autossh -M 0 -o "ExitOnForwardFailure yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -v -R 9999:localhost:80 camserver
