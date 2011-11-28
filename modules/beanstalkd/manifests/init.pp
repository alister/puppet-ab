class beanstalkd { 

    file { "/usr/local/bin/beanstalkd":
        owner => root,
        group => root,
        mode => 755,
        source => "puppet:///modules/beanstalkd/beanstalkd-e50ec077c"
    }
    file { "/usr/local/share/man/man1/beanstalkd.1.gz":
        owner => root,
        group => root,
        mode => 444,
        source => "puppet:///modules/beanstalkd/beanstalkd.1.gz"
    }
    file { "/etc/init.d/beanstalkd":
        owner => root,
        group => root,
        mode => 755,
        source => "puppet:///modules/beanstalkd/beanstalkd.init"
    }
    file { "/etc/default/beanstalkd":
        owner => root,
        group => root,
        mode => 444,
        source => "puppet:///modules/beanstalkd/default"
    }
    file { "/var/lib/beanstalkd":
        require => User["beanstalkd"],
        ensure => directory,
        owner => beanstalkd,
        group => beanstalkd
    }
    user { "beanstalkd":
        ensure => present,
        shell => "/bin/false",
    }
    service { "beanstalkd":
        require => [ File["/usr/local/bin/beanstalkd"],
                         File["/usr/local/share/man/man1/beanstalkd.1.gz"],
                         File["/etc/init.d/beanstalkd"],
                         File["/etc/default/beanstalkd"],
                         File["/var/lib/beanstalkd"],
                         User["beanstalkd"] ],
        enable => true,
        ensure => running,
        hasstatus => true
    }
}
