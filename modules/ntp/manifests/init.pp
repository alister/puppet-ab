class ntp {
  package { 'ntp': ensure => installed }
  service { 'ntp':
    ensure  => running,
    require => Package['ntp'],
  }
  file { '/etc/ntp.conf':
    source  => 'puppet:///modules/ntp/ntp.conf',
    notify  => Service['ntp'],
    require => Package['ntp'],
  }
}
