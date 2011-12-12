# All users known to the system (that are not 
# installed specifically by a package
class user::virtual
{
  # common users / sysadmins
  @user { 'alister': }

  # if we want to install this user for a blog-host
  @user { 'blogs': }

  # if we had installed zend-CE, remove the user if we remove
  #@user { 'zend': ensure => absent }

  # for manually installed beanstalkd
  #@user { 'beanstalkd': }
}
