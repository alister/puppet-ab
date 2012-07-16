class basesw::nas {

  #include app::phpmyadmin

  $sw = [ 'rsnapshot', 'sabnzbdplus' ]
  package { $sw:
    ensure => installed,
  }

  $fortune = ['fortune-mod', 'fortunes', 'fortunes-bofh-excuses',
    'fortunes-min', 'fortunes-off',
  ]
  package { $fortune:
    ensure => installed,
  }
  package { [ 'fortunes-debian-hints', 'fortunes-ubuntu-server']:
    ensure => purged
  }

  # these are listed as Alias's in the portal.alister apache.conf repo
  $phpPkgs = [ 'phpsysinfo', 'phpmyadmin' ]
  package { $phpPkgs:
    ensure  => installed,
    #notify => Service['apache']
  }

}
