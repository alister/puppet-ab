class python {
  package { 'python-dev': ensure        => installed }
  package { 'python-setuptools': ensure => installed }

  file {
    '/var/puppet':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
    '/var/puppet/python':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
    '/var/puppet/python/modules':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
    '/var/puppet/python/ez_setup.py':
      ensure => 'present',
      source => 'puppet:///modules/python/ez_setup.py',
      owner  => 'root',
      group  => 'root',
      mode   => '0500';
  }

  define pymod($name, $version = '') {
    $pymod_record = "/var/puppet/python/modules/${name}.files"

    $req_or_url = $version ? {
      ''      => $name,
      default => "\"${name}==${version}\""
    }

    exec { "easy_install_${name}":
      cwd       => '/root',
      creates   => $pymod_record,
      require   => [ Package['python-dev'], Package['python-setuptools'] ],
      command   => "/usr/bin/easy_install --record ${pymod_record} ${req_or_url}",
      user      => 'root',
      logoutput => on_failure,
    }
  }

  pymod { 'pyparsing': name => pyparsing }
  pymod { 'pytz':      name => pytz }
}
