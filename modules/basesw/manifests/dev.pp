class basesw::dev {

  package { 'rubygems': }

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

  # hack since I'm having trouble with apt::ppa
  exec { 'add-apt-repository-ppa:webupd8team/sublime-text-2':
    command => '/usr/bin/add-apt-repository ppa:webupd8team/sublime-text-2',
    creates => '/etc/apt/sources.list.d/webupd8team-sublime-text-2-precise.list',
  }
  package { 'sublime-text-2-dev': } # or -beta

  apt::source { 'ppa-ondrej-php5':
    location          => 'http://ppa.launchpad.net/ondrej/php5/ubuntu',
    #release          => 'precise',
    #repos            => 'main',
    required_packages => 'ubuntu-keyring ubuntu-extras-keyring',
    key               => 'E5267A6C',
    key_server        => 'keyserver.ubuntu.com',
    #include_src      => false,
  }

  # not yet supported on php5.4 in ppa-ondrej-php5
  #, 'php5-memcached'
  $peclDebs = ['php-apc', 'php5-xdebug', 'php5-gd', ]
  package { $peclDebs:
    ensure   => installed,
  }

  #include app::phpmyadmin
  #include pandoc

}
