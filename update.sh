#!/bin/sh

sudo puppet apply --modulepath=modules --onetime -v --no-daemonize --debug manifests/site.pp
