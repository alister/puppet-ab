class beanstalkd::remove {
  #package { "":
  #  rm "/usr/local/bin/beanstalkd", and others, inc "/mnt/lib/beanstalkd/"
  #  ensure => purged
  #}
  service { 'beanstalkd': ensure => stopped }
}
