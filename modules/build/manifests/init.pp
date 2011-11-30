class build {
  # This is a meta-class, it instsalls dpkg-dev, which in turn installs gcc,
  # g++, development headers, etc to allow us to compile things.
  package { 'dpkg-dev': ensure => installed }
}
