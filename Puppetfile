# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "gcc",            "1.0.0"
github "git",            "1.0.0"
github "homebrew",       "1.1.2"
github "inifile",        "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "ruby",           "4.0.0"
github "stdlib",         "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",           "1.0.0"
github "osx",            "1.1.0"
github "github_for_mac", "1.0.1"
github "firefox",        "1.0.6"
github "tmux",           "1.0.2"
github "virtualbox",     "1.0.2"
github "hipchat",        "1.0.2" 
github "chrome",         "1.1.0"
github "memcached",      "1.2.0"
github "postgresql",     "1.0.0"
github "wget",           "1.0.0"
github "macvim",         "1.0.0"
github "sysctl",         "1.0.0"
github "vagrant",        "2.0.6"
github "iterm2",         "1.0.2"
github "skype",          "1.0.2"
github "repository",      "2.0.2"
# Optional/custom modules. There are tons available at

github "tunnelblick",    "1.0.2", :repo => "randym/puppet-tunnelblick"
# https://github.com/boxen.
