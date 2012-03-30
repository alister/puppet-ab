class ack_grep::remove {
  package { 'ack-grep':
    ensure => purged
  }
}
