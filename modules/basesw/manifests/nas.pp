class basesw::nas {

  #include app::phpmyadmin

  $sw = [ 'rsnapshot' ]
  package { $sw:
    ensure => installed,
  }

  $fortune = ['fortune-mod', 'fortunes', 'fortunes-bofh-excuses',
    'fortunes-debian-hints', 'fortunes-min', 'fortunes-off',
    'fortunes-ubuntu-server']
  package { $fortune:
    ensure => installed,
  }

}
