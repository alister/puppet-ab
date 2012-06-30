#!/bin/sh

#DEBUG=--debug
VERBOSE="-v"
sudo puppet apply --modulepath=modules --onetime -v --no-daemonize $DEBUG $VERBOSE manifests/site.pp
