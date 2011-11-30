class timezone ($zone = 'UTC') {
  # This class sets up the timezone, by default UTC
  #
  # ==Actions
  # set the timezone
  #
  # ==Requires
  # * none
  #
  file { '/etc/localtime':
    ensure => link,
    target => "/usr/share/zoneinfo/${zone}",
  }
}
