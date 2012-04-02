# Developers only, common to all the dev-systems
#
class user::developers
{
  search User::Virtual

  realize( User::Virtual::Ssh_user['alister'],
    # User::Virtual::Ssh_user[''],   more if required
  )
}
