class basesw::dev {

  $genericDebs = [ 'zsync', 'dos2unix', 'jwhois', 'libwww-perl', 'mytop', 'subversion' ]
  package { $genericDebs: ensure => latest }

  package { 'rubygems': }   #first, make sure rubygems is installed
  # Ruby gems we want installed
  $devgems = ['puppet-lint', 'puppet-module',
    'guard', 'guard-phpunit', 'guard-phpcs',
    'guard-shell', 'guard-puppet-lint',
    'jeweler', 'bundler',
    ]
  package { $devgems:
    ensure   => installed,
    provider => 'gem',
    require  => Package[[rubygems]]
  }

  include build

  include dropbox::cli
  # @todo don't install/config. For that - "dropbox start -i"

  # keeps reinstalling different versions...
  #include phpqatools

  # download composer,  PHP: http://getcomposer.org/
  class { 'composer':
    targetdir => '/usr/local/bin/'
  }

  # not yet supported on php5.4 in ppa-ondrej-php5
  #, 'php5-memcached'
  $peclDebs = ['php-apc', 'php5-xdebug', 'php5-gd', 'php5-sqlite', 'php5-cli', 'php-pear']
  package { $peclDebs:
    ensure => installed,
  }

  #include app::phpmyadmin
  #include pandoc

  #class { mongodb:
  #  # Nodes are in a replica set
  #  #replSet            => "example_set_name",
  #  # Increase number of available mongodb connections
  #  ulimit_nofile       => 20000,
  #  #mongod_add_options => ['smallfiles', 'oplogSize 10', 'directoryperdb']   @todo need these on dev
  #}
}
