class memcached {
    package { memcached: ensure => installed }

    file { memcachedconf:
        path => "/etc/memcached.conf",
        owner => "root",
        group => "root",
        mode => 444,
        source => "puppet:///packages/memcached/memcached.conf"
    }

    service { "memcached":
        require => [ Package[memcached], File[memcachedconf] ],
        enable => true,
        ensure => running,
    }
}
