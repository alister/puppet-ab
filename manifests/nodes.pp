node base {
  include basesw   # a number of the most basic packages
  include timezone

  include app::virtual-packages
}

node development inherits base {
  include ack_grep
  include build
  include python
  include rake
  include app::phpmyadmin
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
  notify { 'Server: Oberth': }
}

node puppetc1 inherits base {
  notify { 'Server: Puppet1': }
}

