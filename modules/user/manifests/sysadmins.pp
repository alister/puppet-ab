# Sysadmins known to all the system(s)
#
class user::sysadmins
{
  search User::Virtual

  realize( Ssh_User['alister'] )
}
