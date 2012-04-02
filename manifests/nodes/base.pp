node base {
  include basesw   # a number of the most basic packages
  include basesw::zsh

  class { 'timezone':
    zone => 'Europe/London'
  }
  include app::virtual-packages
  include user::virtual
  include user::sysadmins
  include dns::hosts
}

