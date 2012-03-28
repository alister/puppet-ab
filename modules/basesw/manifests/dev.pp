class basesw::dev {

  package { 'rubygems': }

  # Ruby gems we want installed
  package { ['guard', 'guard-phpunit', 'guard-phpcs',
    'puppet-lint']:

    ensure   => installed,
    provider => 'gem',
    require  => Package[[rubygems]]
  }

}
