node base {
  include basesw   # a number of the most basic packages
  include basesw::zsh

  class { 'timezone':
    zone => 'Europe/London'
  }
  include app::virtual-packages
  include user::virtual
  include user::sysadmins
  include dns::hosts
}


node development inherits base {
  include ack_grep
  include build
  include python
  include rake
  #include app::phpmyadmin
  #include pandoc

#  apt::source { 'ppa-ondrej-php5':
#    location          => 'http://ppa.launchpad.net/ondrej/php5/ubuntu',
#    release           => 'precise',
#    repos             => 'main',
#    required_packages => 'ubuntu-keyring ubuntu-extras-keyring',
#    key               => 'E5267A6C',
#    key_server        => 'keyserver.ubuntu.com',
#    pin               => '-10',
#    include_src       => false
#  }
  include basesw::dev
  include php
  include phpqatools
}

node serverQueue inherits base {
  #include beanstalkd
}
node serverMemcache inherits base {
  #include memcached
}
node serverWorkers inherits base {
  #include supervisord
}

node oberth inherits development {
  include user::developers
  notify { 'Server: Oberth': }
}

node ubuntu inherits development {
  include user::developers
  notify { 'Server: Oberth': }
}

node puppetc1 inherits base {
  notify { 'Server: Puppet1': }
}

