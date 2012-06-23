class basesw::nas {

  #include app::phpmyadmin

  $fortune = ['fortune-mod', 'fortunes', 'fortunes-bofh-excuses', 
    'fortunes-debian-hints', 'fortunes-min', 'fortunes-off', 
    'fortunes-ubuntu-server']
  package { $fortune:
    ensure => installed,
  }

}
