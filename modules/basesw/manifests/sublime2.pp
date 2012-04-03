class basesw::sublime2 {

  # hack since I'm having trouble with apt::ppa
  exec { 'add-apt-repository-ppa:webupd8team/sublime-text-2':
    command => '/usr/bin/add-apt-repository ppa:webupd8team/sublime-text-2',
    creates => '/etc/apt/sources.list.d/webupd8team-sublime-text-2-precise.list',
  }
  package { 'sublime-text-2-dev': } # or -beta

#  exec { 'install-sublime2-package-manager':
#    command => "python -c \"import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None;  urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'\"",
#    creates => '/home/alister/.config/sublime-text-2/Installed Packages/Package Control.sublime-package'
#  }

  # % ls ~/.config/sublime-text-2/Installed\ Packages\

  #git clone https://github.com/spadgos/sublime-jsdocs.git DocBlockr
  exec { 'sublime-package-DocBlockr':
    command => '/usr/bin/git clone https://github.com/spadgos/sublime-jsdocs.git DocBlockr',
    cwd     => '/home/alister/.config/sublime-text-2/Packages/',
    user    => 'alister',
    require => Package['git-core'],
    creates => '/home/alister/.config/sublime-text-2/Packages/DocBlockr/'
  }


  # git clone https://github.com/clintberry/sublime-text-2-ini.git
  exec { 'sublime-package-test-2-ini':
    command => '/usr/bin/git clone https://github.com/clintberry/sublime-text-2-ini.git',
    cwd     => '/home/alister/.config/sublime-text-2/Packages/',
    user    => 'alister',
    require => Package['git-core'],
    creates => '/home/alister/.config/sublime-text-2/Packages/sublime-text-2-ini/'
  }

  # git clone https://github.com/SublimeText/LineEndings.git
  exec { 'sublime-package-LineEndings':
    command => '/usr/bin/git clone https://github.com/SublimeText/LineEndings.git',
    cwd     => '/home/alister/.config/sublime-text-2/Packages/',
    user    => 'alister',
    require => Package['git-core'],
    creates => '/home/alister/.config/sublime-text-2/Packages/LineEndings/'
  }

  # git clone https://github.com/Kronuz/SublimeCodeIntel.git
  exec { 'sublime-package-SublimeCodeIntel':
    command => '/usr/bin/git clone https://github.com/Kronuz/SublimeCodeIntel.git',
    cwd     => '/home/alister/.config/sublime-text-2/Packages/',
    user    => 'alister',
    require => Package['git-core'],
    creates => '/home/alister/.config/sublime-text-2/Packages/SublimeCodeIntel/'
  }

  # git clone https://github.com/spadgos/sublime-ToggleQuotes.git
  exec { 'sublime-package-ToggleQuotes':
    command => '/usr/bin/git clone https://github.com/spadgos/sublime-ToggleQuotes.git',
    cwd     => '/home/alister/.config/sublime-text-2/Packages/',
    user    => 'alister',
    require => Package['git-core'],
    creates => '/home/alister/.config/sublime-text-2/Packages/sublime-ToggleQuotes/'
  }


}