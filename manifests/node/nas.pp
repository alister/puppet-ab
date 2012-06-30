node 'nas.local'   inherits development {
  include user::developers
  include basesw::nas
  notify { 'server: NAS.local': }
}
