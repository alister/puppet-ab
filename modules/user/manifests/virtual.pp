# All users known to the system (that are not 
# installed specifically by a package
class user::virtual
{
  # common users / sysadmins
  #@user { 'alister': }  installed later, with ssh_user

  # if we want to install this user for a blog-host
  @user { 'blogs': }

  # if we had installed zend-CE, remove the user if we remove
  #@user { 'zend': ensure => absent }

  # for manually installed beanstalkd
  #@user { 'beanstalkd': }


  define ssh_user($key)
  {
    user { $name:
      ensure     => present,
      managehome => true,
    }
    ssh_authorized_key { "${name}_key":
      key  => $key,
      type => 'ssh-rsa',
      user => $name,
    }
  }
  @ssh_user { "alister":
    key => "AAAAB3NzaC1yc2EAAAABJQAAAIB0Jh78BTyGDTmbhKqUpWacAtFWbUCz/u7S7cSZnlylyJQQO52lFXY503u+me+uSWFImFemQj8n1yWR5W+yzawz8w+5zKyDzEp6KzGE7G9c8+4imsjbg2P1mDwnNWAV6kzT+B4lHP4PzLN1e+gc2W168s0fSCvFjPU7lPLsdA53jw==",
  }

}
