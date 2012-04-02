class pandoc {
  $pkgs = [ 'pandoc', 'texlive-xetex', 'texlive-latex-recommended', ]
  package { $pkgs:
    ensure => installed }
}
