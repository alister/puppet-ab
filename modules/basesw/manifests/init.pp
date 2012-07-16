# This class sets up the basic software for every server
#
# ==Actions
# Install several packages
#
# ==Requires
# * none
#
# - could be: "Package['puppet']"
#
class basesw {
  $pkgs = [ 'joe', 'git-core', 'pigz', 'zsh', 'openssh-server',
    'rdate', 'build-essential', 'rsync', 'curl', 'wget', 'python-gpgme',
    'sqlite3', 'python-software-properties', 'denyhosts', ]
  package { $pkgs:
    ensure => installed,
  }

  class { 'ntp':
    server_list => [ '0.uk.pool.ntp.org',
      '1.uk.pool.ntp.org',
      '2.uk.pool.ntp.org',
      '3.uk.pool.ntp.org' ]
  }

}
