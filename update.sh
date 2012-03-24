#!/bin/sh

#DEBUG=--debug

sudo puppet apply --modulepath=modules --onetime -v --no-daemonize $DEBUG manifests/site.pp
