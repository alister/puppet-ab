node nas inherits development {
  include user::developers
  include basesw::nas
  notify { 'server: NAS.local': }
}
