# All users known to the system (that are not
# installed specifically by a package
class user::virtual
{
  # All users are listed here - but with '@'. They are
  # 'realized' later, in the more appropriate class

  # common users / sysadmins
  # They are 'realized' in other .pp files.
  @user::virtual::ssh_user { 'alister':
    key => 'AAAAB3NzaC1yc2EAAAABJQAAAIB0Jh78BTyGDTmbhKqUpWacAtFWbUCz/u7S7cSZnlylyJQQO52lFXY503u+me+uSWFImFemQj8n1yWR5W+yzawz8w+5zKyDzEp6KzGE7G9c8+4imsjbg2P1mDwnNWAV6kzT+B4lHP4PzLN1e+gc2W168s0fSCvFjPU7lPLsdA53jw==',
  }

  # if we want to install this user for a blog-host
  @user::virtual::ssh_user { 'blogs': }

  # if we had installed zend-CE, remove the user if we remove
  #@user::virtual::ssh_user { 'zend': ensure => absent }   ensure is not yet supported

  # for manually installed beanstalkd
  @user::virtual::ssh_user { 'beanstalkd': }

}
