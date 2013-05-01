require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git
  include github_for_mac

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # default ruby versions
  # include ruby::1_8_7
  # include ruby::1_9_2
  include ruby::1_9_3

  # Set the global default ruby (auto-installs it if it can)
  class { 'ruby::global':
    version => '2.0.0-p0'
  }
  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # osx setings
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::dock::autohide

  include osx::universal_access::ctrl_mod_zoom

  include osx::no_network_dsstores

  # Firefox
  include firefox

  # tmux
  include tmux

  # virtual box
  include virtualbox

  # hipchat
  include hipchat

  # chrome
  include chrome

  # memcached
  include memcached

  # postgreql
  include postgresql

  # wget
  include wget

  # macvim
  include macvim

}
