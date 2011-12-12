class app::phpmyadmin
{
  realize ( Package['apache2-mpm-prefork'] )
  package { 'phpmyadmin': ensure => installed }
}
