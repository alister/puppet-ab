class basesw {
  # This class sets up the baeic software for every server
  #
  # ==Actions
  # Install several packages
  #
  # ==Requires
  # * none
  #
  # - could be: "Package["puppet"]"
  #
  package { [ 'joe', 'git-core', 'pigz', 'zsh' ]:
    ensure => installed,
  }

  class { 'ntp':
    server_list => [ '0.uk.pool.ntp.org', '1.uk.pool.ntp.org', '2.uk.pool.ntp.org', '3.uk.pool.ntp.org' ]
  }

}
