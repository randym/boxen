class people::randym {

  include github_for_mac

  # macvim
  include macvim

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

  include ruby::2_0_0_p0
}
