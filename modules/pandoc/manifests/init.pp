class pandoc {
  package { [ 'pandoc',
    'texlive-xetex', 
    'texlive-latex-recommended',
    ]: 
    ensure => installed }
}
