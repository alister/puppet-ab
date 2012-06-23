#
# @todo could I put this into an array/map?
#
class dns::hosts {
  host { 'home.abulman.co.uk':
    ensure => present,
    ip     => '94.194.200.158',
    target => '/etc/hosts',
  }
  host { 'nas.abulman.co.uk':
    ensure => present,
    ip     => '192.168.1.110',
    target => '/etc/hosts',
  }
}
