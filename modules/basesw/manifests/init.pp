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
  package { [ 'joe', 'git', 'ntp', 'pigz' ]:
    ensure => installed,
  }
}