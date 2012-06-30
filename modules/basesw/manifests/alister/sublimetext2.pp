/**
* Plugins that I have installed by default
*
* I've not actually used all of them yet....
*/
class basesw::alister::sublimetext2 {

  # these must be set
  class { 'sublimetext2::params':
    userName        => 'alister',
    installBasePath => '/home/alister/.config/sublime-text-2/Packages'
    # @TODO given the userName, and the OS, we could probably
    # work out the installBasePath in ::params ??
  }
  # also required
  include sublimetext2

  sublimetext2::plugin { 'DocBlockr':
    gitUrl => 'https://github.com/spadgos/sublime-jsdocs.git'
  }
  sublimetext2::plugin { 'text-2-ini':
    gitUrl => 'https://github.com/clintberry/sublime-text-2-ini.git'
  }
  sublimetext2::plugin { 'LineEndings':
    gitUrl => 'https://github.com/SublimeText/LineEndings.git'
  }
  sublimetext2::plugin { 'SublimeCodeIntel':
    gitUrl => 'https://github.com/Kronuz/SublimeCodeIntel.git'
  }
  sublimetext2::plugin { 'ToggleQuotes':
    gitUrl => 'https://github.com/spadgos/sublime-ToggleQuotes.git'
  }
  sublimetext2::plugin { 'SmartMatch':
    gitUrl => 'git@github.com:ccampbell/sublime-smart-match.git'
  }
  sublimetext2::plugin { 'sublime_alignment':
    gitUrl => 'https://github.com/wbond/sublime_alignment'
  }
  sublimetext2::plugin { 'SublimeTODO':
    gitUrl => 'https://github.com/robcowie/SublimeTODO.git'
  }
  sublimetext2::plugin { 'Rake':
    gitUrl => 'https://github.com/SublimeText/Rake.git'
  }
  #sublimetext2::plugin { 'PuppetText':
  #  gitUrl => 'https://github.com/arioch/sublime-text-puppet.git'
  #}
  sublimetext2::plugin { 'SublimeLinter':
    gitUrl => 'https://github.com/Kronuz/SublimeLinter'
  }

}