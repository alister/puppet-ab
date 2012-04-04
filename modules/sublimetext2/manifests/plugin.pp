# Add a define to allow installing SUBLIME-TEXT-2 packages from a git repo
define sublimetext2::plugin (
  $gitUrl,
  $pluginName = $title
) {
  include sublimetext2::params

  exec { "sublime-package-${pluginName}":
    #name    => $pluginName,
    command => "/usr/bin/git clone $gitUrl $pluginName",

    cwd     => $sublimetext2::params::installBasePath,
    user    => $sublimetext2::params::userName,
    creates => "${sublimetext2::params::installBasePath}/${pluginName}/",
  }

}
