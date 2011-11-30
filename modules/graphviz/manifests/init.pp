class graphviz {
  # This class sets up the graphviz package
  #
  # ==Actions
  # Install graphviz
  #
  # ==Requires
  # * none
  #
  # - could be: "Package["puppet"]"
  #
  package { 'graphviz':
    ensure => installed
  }
}
