# required to run commands from within a manifest
Exec { path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin' }

import 'templates'
import 'nodes'
