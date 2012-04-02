define user::virtual::ssh_user($key)
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
