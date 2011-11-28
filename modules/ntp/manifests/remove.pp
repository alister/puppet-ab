class ntp::remove { 
    package { "ntp":
    	ensure => purged
    }
    service { "ntp":
    	ensure => stopped,
    }
}
