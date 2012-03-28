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

  include basesw::dev
  include phpqatools
  include php
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

