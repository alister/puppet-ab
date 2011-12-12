node base {
  include basesw   # a number of the most basic packages
  include timezone
}

node development inherits base {
  include ack_grep
  include build
  include python
  include rake
}

node serverQueue inherits base {
  #beanstalkd
}
node serverMemcache inherits base {
  #include memcached
}
node serverWorkers inherits base {
  #include supervisord
}

node oberth inherits base {
}

node puppetc1 inherits base {
}

