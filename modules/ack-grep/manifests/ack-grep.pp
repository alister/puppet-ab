class ack-grep { 'ack-grep':
    package { "ack-grep":
    	ensure => installed
    }
}

class { 'ack-grep': }

