class app::virtual-packages
{
  # '@' signifies a virtual package. 'realise(...)' uses it.
  # See puppet cookbook, pp136-139
  @package { 'apache2-mpm-prefork': ensure => installed }
}
