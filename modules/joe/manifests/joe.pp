class joe {
    package { "joe":
    	ensure => installed
    }
}

class { 'joe': }