class basesw::dev {

  package { 'zsync': ensure => latest }

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

  include basesw::alister::sublimetext2  # my own plugins...

  # apt::source { 'ppa-ondrej-php5':
  #   location          => 'http://ppa.launchpad.net/ondrej/php5/ubuntu',
  #   #release          => 'precise',
  #   #repos            => 'main',
  #   required_packages => 'ubuntu-keyring ubuntu-extras-keyring',
  #   key               => 'E5267A6C',
  #   key_server        => 'keyserver.ubuntu.com',
  #   #include_src      => false,
  # }

  # not yet supported on php5.4 in ppa-ondrej-php5
  #, 'php5-memcached'
  $peclDebs = ['php-apc', 'php5-xdebug', 'php5-gd', 'php5-sqlite']
  package { $peclDebs:
    ensure   => installed,
  }

  #include app::phpmyadmin
  #include pandoc
}
