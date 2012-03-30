class basesw::zsh {

  # @todo git/git-core according to $OS
  exec { 'get-oh-my-zsh':
    command => '/usr/bin/git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh',
    cwd     => '/home/alister',
    user    => 'alister',
    require => Package['git-core', 'zsh', 'build-essential'],
    creates => '/home/alister/.oh-my-zsh'
  }

  exec { 'chsh-zsh':
    # Don't run this if already has zsh set.
    command => 'chsh -s /bin/zsh alister',
    require => Package['zsh'],
    onlyif  => 'grep ^alister:x /etc/passwd | grep -c bin/bash'
    # `grep alister /etc/passwd | cut -d : -f 7` >>> "/bin/zsh"
  }

}
