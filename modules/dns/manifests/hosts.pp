
class dns::hosts {

  host { 'home.abulman.co.uk':
    ip     => '94.194.200.158',
    target => '/etc/hosts',
    ensure => present,
  }
}
