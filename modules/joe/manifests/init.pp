class joe {
  # This class sets up the joe editor
  #
  # ==Actions
  # Install a package, Joes Own Editor.
  #
  # ==Requires
  # * none
  #
  # - could be: "Package["puppet"]"
  #
  package { 'joe': ensure => installed }
}
