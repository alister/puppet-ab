class sublimetext2::config
{

  # hack since I'm having trouble with apt::ppa
  exec { 'add-apt-repository-ppa:webupd8team/sublime-text-2':
    command => '/usr/bin/add-apt-repository ppa:webupd8team/sublime-text-2',
    creates => '/etc/apt/sources.list.d/webupd8team-sublime-text-2-precise.list',
  }
  file { $sublimetext2::params::installBasePath:
    ensure  => directory,
    title => 'create dir',
    owner   => $sublimetext2::params::userName,
    mode    => '0775',
    recurse => true
  }

}