node ubuntu inherits development {
  include user::developers
  notify { 'Server: Oberth': }
}

