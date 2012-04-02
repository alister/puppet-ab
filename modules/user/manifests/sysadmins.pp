# Sysadmins known to all the system(s)
#
class user::sysadmins
{
  search User::Virtual

  realize( User::Virtual::Ssh_user['alister'] )
}
